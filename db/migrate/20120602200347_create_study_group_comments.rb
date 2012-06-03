class CreateStudyGroupComments < ActiveRecord::Migration
  def change
    create_table :study_group_comments do |t|
      t.integer :user_id
      t.integer :study_group_id
      t.integer :comment_id
      t.text :body

      t.timestamps
    end
  end
end
