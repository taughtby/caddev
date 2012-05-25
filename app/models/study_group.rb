class StudyGroup < ActiveRecord::Base
  attr_accessible :tutor_id, :subject_id
  
  belongs_to :tutor
  belongs_to :subject
  has_many :students, :through => :study_group_registrations
  
end
