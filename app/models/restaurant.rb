class Restaurant < ActiveRecord::Base
  belongs_to :owner
  mount_uploader :image, ImageUploader
  
  has_many :reservations, dependent: :destroy
  
  has_many :category_restaurants, dependent: :destroy
  has_many :categories, through: :category_restaurants
  
  validates :name, presence: true
end
