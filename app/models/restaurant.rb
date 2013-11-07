class Restaurant < ActiveRecord::Base
  belongs_to :owner
  mount_uploader :image, ImageUploader
end
