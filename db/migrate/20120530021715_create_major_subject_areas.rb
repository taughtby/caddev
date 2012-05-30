class CreateMajorSubjectAreas < ActiveRecord::Migration
  def change
    create_table :major_subject_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
