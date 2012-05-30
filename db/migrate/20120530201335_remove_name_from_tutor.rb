class RemoveNameFromTutor < ActiveRecord::Migration
  def change
  	remove_column :tutors, :name
  end
end
