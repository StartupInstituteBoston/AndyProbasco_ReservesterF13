class CategoriesRestaurants < ActiveRecord::Migration
  def change
    create_table :categories_restaurants do |t|
      t.integer :restaurant_id
      t.integer :category_id
    end
  end
end
