class StudyGroup < ActiveRecord::Base
  attr_accessible :tutor_id, :subject_id
  
  belongs_to :tutor
  belongs_to :subject
  has_many :study_group_registrations, :dependent => :destroy
  has_many :students, :through => :study_group_registrations
  has_many :study_group_posts, :dependent => :destroy
  has_many :study_group_comments, :through => :study_group_posts
end
