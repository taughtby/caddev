class PagesController < ApplicationController
  
  def index
    @home_page = true
  end
  
  def home
    @home_page = true
    
    @subjects = []
    Subject.all.each do |s|
      @subjects << s.name
    end
    puts "#{@subjects}"
  end


end