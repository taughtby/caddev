class Student < ActiveRecord::Base
  attr_accessible :user_id
  
  belongs_to :user
  
  has_many :study_groups, :through => :study_group_registrations
  has_many :study_group_registrations, :dependent => :destroy
  has_many :tutors, :through => :study_groups
  has_many :subjects, :through => :study_groups
  has_many :tutor_reviews
  
  def name
    return self.user.name
  end
  def address
    return self.user.address
  end
end
