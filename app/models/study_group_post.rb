class StudyGroupPost < ActiveRecord::Base
  attr_accessible :body, :study_group_id, :title, :user_id
end
