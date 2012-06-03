class CreateTutorMaterials < ActiveRecord::Migration
  def change
    create_table :tutor_materials do |t|
      t.integer :tutor_id
      t.text :description

      t.timestamps
    end
  end
end
