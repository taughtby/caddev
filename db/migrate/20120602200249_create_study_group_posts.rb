class CreateStudyGroupPosts < ActiveRecord::Migration
  def change
    create_table :study_group_posts do |t|
      t.integer :user_id
      t.integer :study_group_id
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
