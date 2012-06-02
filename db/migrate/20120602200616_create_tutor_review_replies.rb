class CreateTutorReviewReplies < ActiveRecord::Migration
  def change
    create_table :tutor_review_replies do |t|
      t.integer :tutor_review_id
      t.integer :tutor_id
      t.text :explanation_text

      t.timestamps
    end
  end
end
