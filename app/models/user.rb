class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name, :email, :password
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_many :activities

  def slug
    self.name.gsub(" ","-")
  end

  def self.find_by_slug(slugged_name)
    self.all.each {|n| n.slug == slugged_name}
  end
end
