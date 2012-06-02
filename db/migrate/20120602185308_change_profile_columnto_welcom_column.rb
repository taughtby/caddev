class ChangeProfileColumntoWelcomColumn < ActiveRecord::Migration
  def change
  	rename_column :tutors, :profile, :tutor_welcome
  end
end
