class SessionsController < ApplicationController
  def destroy
      reset_session
      redirect_to root_url, notice: 'See ya!'
    end

    def new
    end

    def create
      user = User.find_by_email(params[:email])
      if user
        if user.authenticate(params[:password])
          session[:uid] = user.id
          redirect_to root_url, notice: "Welcome back!"
        else
          flash[:notice] = "Unknown email or password"
          render :new
        end
      else
        flash[:notice] = "Unknown email or password"
        render :new
      end
    end
end
