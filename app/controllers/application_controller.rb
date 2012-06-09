class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def require_login
    if session[:uid].nil?
      redirect_to root_url, notice: "Please Login"
    else
      @user = User.find(session[:uid])
    end
  end

end
