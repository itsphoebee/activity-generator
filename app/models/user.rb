class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :email, :password
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_many :activities
end
