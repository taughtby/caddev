class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id
      t.integer :account_id
      t.integer :calendar_id

      t.timestamps
    end
  end
end
