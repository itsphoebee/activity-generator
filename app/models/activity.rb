class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  def slug
    self.name.gsub(" ","-")
  end

  def self.find_by_slug(slugged_name)
    self.all.each {|n| n.slug == slugged_name}
  end
end
