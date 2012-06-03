class StudyGroupPost < ActiveRecord::Base
  attr_accessible :body, :study_group_id, :title, :user_id
  
  has_many :study_group_comments, :dependent => :destroy
  belongs_to :user
  belongs_to :study_group
end
