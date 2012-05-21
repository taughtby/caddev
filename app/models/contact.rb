class Contact < ActiveRecord::Base
  attr_accessible :address, :email, :name
  
  belongs_to :user
end
