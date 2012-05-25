class Tutor < ActiveRecord::Base
  attr_accessible :account_id, :calendar_id, :user_id
  
  belongs_to :user
  has_many :study_groups
  has_many :students, :through => :study_group_registrations
end
