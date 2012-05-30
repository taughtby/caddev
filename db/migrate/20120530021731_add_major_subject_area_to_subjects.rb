class AddMajorSubjectAreaToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :major_subject_area_id, :integer
  end
end
