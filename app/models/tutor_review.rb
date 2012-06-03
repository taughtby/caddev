class TutorReview < ActiveRecord::Base
  attr_accessible :review_text, :stars, :student_id, :tutor_id
  
  
  belongs_to :tutor
  belongs_to :student
  has_one :tutor_review_reply
end
