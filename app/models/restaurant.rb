class Restaurant < ActiveRecord::Base
  belongs_to :owner
  mount_uploader :image, ImageUploader
  
  has_many :reservations, dependent: :destroy
  
  validates :name, presence: true
end
