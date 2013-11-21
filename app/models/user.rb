class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :restaurants, dependent: :destroy
  has_many :stars
  has_many :starred_restaurants, :through => :stars, :source => :restaurant
  
  validates :email, presence: true
  
  def isOwner?
    return self.role == "owner"
  end
end
