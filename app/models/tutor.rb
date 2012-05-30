class Tutor < ActiveRecord::Base
  attr_accessible :account_id, :calendar_id, :user_id
  
  belongs_to :user
  has_many :study_groups, :dependent => :destroy
  has_many :students, :through => :study_group_registrations
  
  def name
    return self.user.name
  end
  def address
    return self.user.address
  end
end
