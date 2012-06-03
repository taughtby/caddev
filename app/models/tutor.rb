class Tutor < ActiveRecord::Base
  attr_accessible :account_id, :calendar_id, :user_id, :profile
  
  belongs_to :user
  has_many :study_groups, :dependent => :destroy
  has_many :students, :through => :study_groups
  has_many :tutor_reviews
  has_many :tutor_review_replies
  has_many :tutor_materials
  
  def name
    return self.user.name
  end
  def address
    return self.user.address
  end
end
