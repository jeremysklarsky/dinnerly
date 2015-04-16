class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(:email => params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user 
      login(@user)
      if session[:dinner_path]
        redirect_to session[:dinner_path]
      # elsif session[:reset_path]
      #   redirect_to session[:reset_path]
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

  def reset_password
  end

  def send_password
    @user = User.find_by(:email => params[:email])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    UserMailer.create_and_deliver_password_change(@user, random_password).deliver
    reset_session
    redirect_to login_path
  end

end
