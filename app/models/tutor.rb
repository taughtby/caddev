class Tutor < ActiveRecord::Base
  attr_accessible :account_id, :calendar_id, :user_id, :profile
  
  belongs_to :user
  has_many :study_groups, :dependent => :destroy
  has_many :students, :through => :study_groups
  
  def name
    return self.user.name
  end
  def address
    return self.user.address
  end
end
