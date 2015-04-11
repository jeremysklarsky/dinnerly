class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(:email => params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user 
      login(@user)
      if session[:dinner_path]
        redirect_to session[:dinner_path]
      else
        flash[:notice] = "Successfully logged in. Welcome #{@user.name}!"
        redirect_to root_path
      end
    else
      flash.now[:notice] = "User name or password is not valid."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end
