class InitialSchema < ActiveRecord::Migration[5.0]
  def change

    create_table :gigs do |t|
      t.string  :name
      t.text    :description
      t.integer :budget
      t.string  :location
      t.boolean :open, default: true
      t.integer :awarded_proposal
      t.references :category, index: true
      t.float   :latitude
      t.float   :longitude
      t.timestamps
    end

    create_table :categories do |t|
      t.string  :name
    end

    create_table :skills do |t|
      t.string  :name
    end

    create_table :proposals do |t|
      t.integer :bid
      t.text    :description
      t.references :gig, index: true
      t.timestamps
    end

    create_table :abilities do |t|
      t.references :gig, index: true
      t.references :skill, index: true
    end

  end
end
