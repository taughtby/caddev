class Tutor < ActiveRecord::Base
  attr_accessible :account_id, :calendar_id, :user_id, :tutor_welcome
  
  belongs_to :user
  has_many :study_groups, :dependent => :destroy
  has_many :subjects, :through => :study_groups
  has_many :students, :through => :study_groups
  has_many :tutor_reviews
  has_many :tutor_review_replies
  has_many :tutor_materials
  has_many :faqs
  
  def name
    return self.user.name
  end
  def address
    return self.user.address
  end
end
