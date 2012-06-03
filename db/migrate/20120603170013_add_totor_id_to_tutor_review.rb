class AddTotorIdToTutorReview < ActiveRecord::Migration
  def change
    add_column :tutor_reviews, :tutor_id, :integer 
  end
end
