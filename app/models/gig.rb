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
      if category.present?
        gigs = category.gigs
      end
    else
      where(["name LIKE ? or description like ?", "%#{params}%", "%#{params}%"])
    end
  end

end