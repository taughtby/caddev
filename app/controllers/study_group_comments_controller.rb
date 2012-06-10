class StudyGroupCommentsController < ApplicationController

  def new
    @study_group_post = StudyGroupPost.find_by_id(params[:study_group_id])
    @study_group_comment = @study_group_post.study_group_comment.build
   
  end
  
  def create 
     @study_group = StudyGroup.find_by_id(params[:study_group_id])
      @study_group_post = @study_group.study_group_posts.build(params[:study_group_post])
      if @study_group_post.save
        flash[:notice] = 'Post was successfully created'
        logger.debug "SAVED WORK"
      else
        flash[:alert] = 'Post NOT created'
         logger.debug "DIDNT WORK"
      end
      redirect_to :back 
      # study_group_url(params[:study_group_id])
  end
end
