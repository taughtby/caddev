class TutorReviewsController < ApplicationController

	def create
		@tutor_review = TutorReview.create(params[:tutor_review])
		redirect_to :back		
	end

end