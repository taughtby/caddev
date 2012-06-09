class TutorsController < ApplicationController
	
	def index
	  @tutors = Tutor.find(:all)
	  @subjects = MajorSubjectArea.find(:all)
	  @tutors = Tutor.page(params[:page]).per(10)
	end

	def edit
		@tutor = Tutor.find_by_id(params[:id])
	end

	def update
		tutor = Tutor.find_by_id(params[:id])
		tutor.update_attributes(params[:tutor])
		redirect_to "/tutors/#{tutor.id}"
	end

	def show
		@tutor = Tutor.find_by_id(params[:id])
		#how do i set different background images
		@tutor_show = true
	end

end