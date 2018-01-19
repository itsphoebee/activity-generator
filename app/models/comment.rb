class Comment < ActiveRecord::Base
  belongs_to :user
  has_many :activity_comments
  has_many :activities, through: :activity_comments
  validates_presence_of :content
end
