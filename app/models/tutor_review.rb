class TutorReview < ActiveRecord::Base
  attr_accessible :review_text, :stars, :user_id
end
