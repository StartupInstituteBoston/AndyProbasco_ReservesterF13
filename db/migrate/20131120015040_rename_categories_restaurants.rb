class RenameCategoriesRestaurants < ActiveRecord::Migration
  def self.up
    rename_table :categories_restaurants, :category_restaurants
  end
  
  def self.down
    rename_table :category_restaurants, :categories_restaurants
  end
end
