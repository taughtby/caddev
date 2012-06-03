class ChangeDependencyOfStudyGroupCommemtToPost < ActiveRecord::Migration
  def change
    rename_column :study_group_comments, :study_group_id, :study_group_post_id
  end

end
