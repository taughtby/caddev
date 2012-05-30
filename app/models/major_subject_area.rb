class MajorSubjectArea < ActiveRecord::Base
  attr_accessible :name
  
  has_many :subjects, :dependent => :destroy
  has_many :study_groups, :through => :subjects
  has_many :tutors, :through => :study_groups
end
