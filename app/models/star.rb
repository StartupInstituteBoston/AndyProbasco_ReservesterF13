class Star < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates_uniqueness_of :user, :scope => :restaurant
end
