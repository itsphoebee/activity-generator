class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_many :activities
  has_many :comments

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slugged_name)
    self.all.find{|n| n.slug == slugged_name}
  end
end
