class TutorReviewReply < ActiveRecord::Base
  attr_accessible :explanation_text, :tutor_id, :tutor_review_id
  
  belongs_to :tutor
  belongs_to :tutor_review
end
