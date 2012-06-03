class AddInformationToStudyGroup < ActiveRecord::Migration
  def change
    add_column :study_groups, :student_limit, :integer 
  	add_column :study_groups, :cost_per_hour, :integer
  	add_column :study_groups, :syllabus, :text
  end
end
