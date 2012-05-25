class CreateStudyGroupRegistrations < ActiveRecord::Migration
  def change
    create_table :study_group_registrations do |t|
      t.integer :study_group_id
      t.integer :student_id

      t.timestamps
    end
  end
end
