class CreateDistances < ActiveRecord::Migration
  def change
    create_table :distances do |t|
      t.string :row_zip
      t.string :col_zip
      t.float :kms

      t.timestamps
    end
  end
end
