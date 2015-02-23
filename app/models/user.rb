class User < ActiveRecord::Base
  has_many :courses
  
  has_secure_password

  validates :user_name, uniqueness: true
end
