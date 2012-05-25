class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :address, :email
  has_secure_password
  
  # destroy the tutor or student associated with this user if the user is destroyed
  has_one :tutor, :dependent => :destroy
  has_one :student, :dependent => :destroy
end
