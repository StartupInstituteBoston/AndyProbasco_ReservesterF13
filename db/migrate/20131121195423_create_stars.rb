class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.datetime :time_created
    end
  end
end
