class Subject < ActiveRecord::Base
  attr_accessible :name
  
  has_many :study_groups
  has_many :tutors, :through => :study_groups
  has_many :students, :through => :study_group_registrations
end
