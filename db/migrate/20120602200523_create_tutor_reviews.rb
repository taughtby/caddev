class CreateTutorReviews < ActiveRecord::Migration
  def change
    create_table :tutor_reviews do |t|
      t.integer :user_id
      t.integer :stars
      t.text :review_text

      t.timestamps
    end
  end
end
