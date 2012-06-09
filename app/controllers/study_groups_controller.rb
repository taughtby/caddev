class StudyGroupsController < ApplicationController
  def index
    @study_groups = StudyGroup.find(:all)
    @search_zip = Zipcode.find_by_code("60606")
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
   @study_group = StudyGroup.find_by_id(params[:id])
   @tutor= @study_group.tutor
   @study_group_posts = StudyGroupPost.new
  
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
