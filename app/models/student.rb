class Student < ActiveRecord::Base
  attr_accessible :user_id
  
  belongs_to :user
  
  has_many :study_groups
  has_many :tutors, :through => :study_groups
  has_many :subjects, :through => :study_groups
end
