class User < ActiveRecord::Base
  attr_accessible :name, :password
  
  has_one :contact
end
