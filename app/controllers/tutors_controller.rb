class TutorsController < ApplicationController
	
	def index
	  @tutors = Tutor.find_all
	  @subjects = MajorSubjectArea.all
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
	end

end