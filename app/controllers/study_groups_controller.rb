class StudyGroupsController < ApplicationController
  def index
    @study_groups = StudyGroup.find(:all)
    
    # if params[:subject].present? && params[:location].present?
    #       puts "RECEIVED subject = '#{params[:subject]}'"
    #       puts "RECEIVED location = '#{params[:location]}'"
    #       
    #       @subjects = Subject.where( "LOWER(name) LIKE ?", params[:subject].downcase ).limit(1)  
    #       
    #       if @subjects.count > 0
    #         puts "found #{@subjects.count} matching #{params[:subject]}"  
    #         @tutors = Tutor.find_all
    #         @subjects = MajorSubjectArea.all
    #       end
    #     end
    if @study_groups.count == 0
      flash[:notice] = "No results for subject = #{params[:subject]} location = #{params[:location]}"
      redirect_to root_url
    end
    
  end

  def show
  end

  def update
  end

  def new
  end

  def create
  end

  def delete
  end
end
