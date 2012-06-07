class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :code
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
