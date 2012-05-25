module ApplicationHelper
  def current_user
      User.find_by_id(session[:uid])
    end
end
