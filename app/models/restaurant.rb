class Restaurant < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader
  
  has_many :reservations, dependent: :destroy
  
  has_many :category_restaurants, dependent: :destroy
  has_many :categories, :through => :category_restaurants
  
  
  has_many :stars
  has_many :starred_by, :through => :stars, :source => :user
  
  validates :name, presence: true
end
