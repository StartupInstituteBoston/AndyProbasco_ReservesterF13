class Category < ActiveRecord::Base
  has_many :category_restaurants, dependent: :destroy
  has_many :restaurants, through: :category_restaurants
  
  validates :name, presence: true
end
