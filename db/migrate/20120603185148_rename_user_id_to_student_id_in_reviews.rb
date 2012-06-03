class RenameUserIdToStudentIdInReviews < ActiveRecord::Migration
  def change
    rename_column :tutor_reviews, :user_id, :student_id
  end
end
