class StudentsController < ApplicationController
	def show
		@user = User.find_by_id(session[:uid])
		@student = Student.find_by_user_id(@user.id)
		@tutor_review = TutorReview.new

	end
end