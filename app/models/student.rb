class Student < ActiveRecord::Base
  attr_accessible :account_id, :calendar_id, :user_id
  
  has_one :user, :account, :calendar
  has_one :contact, :through => :users
  
  has_many :study_groups
  has_many :students, :through => :study_groups
end
