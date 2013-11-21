class CategoryRestaurant < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :category
  validates_uniqueness_of :restaurant, :scope => :category
end
