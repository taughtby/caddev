class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :email, :street, :state, :city, :zip
  has_secure_password
  
  def zipcode
    return Zipcode.find_by_code( self.zip.to_s )
  end
  
  # destroy the tutor or student associated with this user if the user is destroyed
  has_one :tutor, :dependent => :destroy
  has_one :student, :dependent => :destroy
end
