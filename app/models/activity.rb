class Activity < ActiveRecord::Base #it's really just the business
  belongs_to :user
  belongs_to :category
end
