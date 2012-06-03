class StudyGroupComment < ActiveRecord::Base
  attr_accessible :body, :comment_id, :study_group_post_id, :user_id
  
  belongs_to :study_group_post
  belongs_to :user
end
