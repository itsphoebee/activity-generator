class ActivityComment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :activity
end
