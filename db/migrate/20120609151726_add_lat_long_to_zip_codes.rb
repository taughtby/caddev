class AddLatLongToZipCodes < ActiveRecord::Migration
  def change
    add_column :zipcodes, :latitude, :float 
  	add_column :zipcodes, :longitude, :float 
  end
end
