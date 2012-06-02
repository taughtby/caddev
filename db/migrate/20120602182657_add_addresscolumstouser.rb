class AddAddresscolumstouser < ActiveRecord::Migration
  def change
  	remove_column :users, :address
  	add_column :users, :street, :string 
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :zip, :integer
  end
end
