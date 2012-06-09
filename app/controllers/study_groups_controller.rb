class StudyGroupsController < ApplicationController
  def index
    
    if params[:subject].present? && params[:location].present?
      @search_zip = Zipcode.find_by_code(params[:location])
      @subject = Subject.find_by_name(params[:subject])
      if @search_zip.nil?
        flash[:notice] = "No results for zipcode = #{params[:location]}"
        redirect_to root_url
      elsif @subject.nil?
        flash[:notice] = "No results for subject = #{params[:subject]}"
        redirect_to root_url
      end
      
      @study_groups = StudyGroup.find_all_by_subject_id( @subject.id )

      if @study_groups.count == 0
        flash[:notice] = "No results for subject = #{params[:subject]} location = #{params[:location]}"
        redirect_to root_url
      end
    else
      @study_groups = StudyGroup.find(:all, :limit=>1000)
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
