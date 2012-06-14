class TutorReviewsController < ApplicationController
	before_filter :require_login, :except => [:show]
	def create
		@tutor_review = TutorReview.create(params[:tutor_review])
		redirect_to :back		
	end

end