class Gig < ActiveRecord::Base
  has_many :proposals
  belongs_to :category, optional: true
  has_many :abilities
  has_many :skills, through: :abilities
  belongs_to :user

  geocoded_by :location
  after_validation :geocode


  def self.search(params)
    if params[:category].present?
      category = Category.find_by_name(params[:category])
      where(category_id: category.id).where(["name LIKE ? or description like ? or location like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"])
    else
      where(["name LIKE ? or description like ? or location like ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"])
    end
  end

  def skill_list=(skills_string)
    skill_names = skills_string.split(',').collect {|s| s.strip.downcase}.uniq
    new_or_found_skills = skill_names.collect {|name| Skill.find_or_create_by(name: name)}
    self.skills = new_or_found_skills
  end

  def skill_list
    self.skills.collect {|skill| skill.name}.join(', ')
  end

  def self.order_list(sort_order)
    if sort_order == 'newest' || sort_order.blank?
      order(created_at: :desc)
    elsif sort_order == 'oldest'
      order(created_at: :asc)
    elsif sort_order == 'low budget'
      order(budget: :asc)
    elsif sort_order == 'high budget'
      order(budget: :desc)
    elsif sort_order == 'name'
      order(name: :asc)
    end
  end

end