class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  def slug
    self.name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slugged_name)
    self.all.find {|n| n.slug == slugged_name}
  end
end
