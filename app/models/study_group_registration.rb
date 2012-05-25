class StudyGroupRegistration < ActiveRecord::Base
  attr_accessible :student_id, :study_group_id
  
  belongs_to :student
  belongs_to :study_group
end
