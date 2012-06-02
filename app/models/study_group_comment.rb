class StudyGroupComment < ActiveRecord::Base
  attr_accessible :body, :comment_id, :study_group_id, :user_id
end
