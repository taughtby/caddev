class StudyGroup < ActiveRecord::Base
  attr_accessible :tutor_id
  
  belongs_to :tutor
  has_many :students
  
end
