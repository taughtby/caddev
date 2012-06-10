class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :descrition
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day
      t.integer :study_group_id

      t.timestamps
    end
  end
end
