class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :user_id
      t.string :image
      t.integer :minimum_number_of_participants
      t.string :description
      t.integer :estimated_cost
      t.date :date
      t.string :location
      t.string :title

      t.timestamps

    end
  end
end
