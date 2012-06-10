class StudyGroupCommentsController < ApplicationController

  def new
    @study_group = StudyGroup.find_by_id(params[:study_group_id])
    @study_group_post = StudyGroupPost.find_by_id(params[:study_group_post_id])
    @study_group_comment = @study_group_post.study_group_comments.build
   
  end
  
  def create 
     @study_group = StudyGroup.find_by_id(params[:study_group_id])
     @study_group_post = StudyGroupPost.find_by_id(params[:study_group_post_id])
     @study_group_comment = @study_group_post.study_group_comments.build(params[:study_group_comment])
     
      if @study_group_comment.save
        flash[:notice] = 'comment was successfully created'
        logger.debug "SAVED WORK"
      else
        flash[:alert] = 'Comment NOT created'
         logger.debug "DIDNT WORK"
      end
      redirect_to study_group_url(params[:study_group_id])
  end
end
