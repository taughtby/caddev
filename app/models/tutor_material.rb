class TutorMaterial < ActiveRecord::Base
  attr_accessible :description, :tutor_id
  
  belongs_to :tutor
  
end
