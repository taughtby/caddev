class TutorReviewReply < ActiveRecord::Base
  attr_accessible :explanation_text, :tutor_id, :tutor_review_id
end
