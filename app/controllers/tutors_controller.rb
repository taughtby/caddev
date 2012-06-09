class TutorsController < ApplicationController
	
	def index
	  if params[:subject].present? && params[:location].present?
	    puts "RECEIVED subject = '#{params[:subject]}'"
  	  puts "RECEIVED location = '#{params[:location]}'"
  	  
  	  @subjects = Subject.where( "LOWER(name) LIKE ?", params[:subject].downcase ).limit(1)  
  	  
  	  if @subjects.count > 0
  	    puts "found #{@subjects.count} matching #{params[:subject]}"  
  		  @tutors = Tutor.find_all
  		  @subjects = MajorSubjectArea.all
		  end
    end
    
      
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