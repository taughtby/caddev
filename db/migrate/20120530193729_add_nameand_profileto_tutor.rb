class AddNameandProfiletoTutor < ActiveRecord::Migration
  def change
  	
  	add_column :tutors, :profile, :text
  end
end
