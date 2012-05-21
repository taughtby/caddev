class CreateStudyGroups < ActiveRecord::Migration
  def change
    create_table :study_groups do |t|
      t.integer :tutor_id

      t.timestamps
    end
  end
end
