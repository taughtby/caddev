class StudentsController < ApplicationController
	def show
		@student = User.find_by_id(session[:uid])
		@tutor_review = TutorReview.new
	end
end