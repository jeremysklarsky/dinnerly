class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash
      @user = User.handle_facebook_login(auth_hash)
    else
      @user = User.find_by(:email => params[:user][:email]).try(:authenticate, params[:user][:password])
    end
    
    if @user
      login(@user)
      if session[:dinner_path]
        redirect_to session[:dinner_path]
      else
        flash[:notice] = "Successfully logged in. Welcome, #{@user.name}!"
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
    if User.find_by(:email => params[:email]) 
      @user = User.find_by(:email => params[:email])
      random_password = Array.new(10).map { (65 + rand(58)).chr }.join
      @user.password = random_password
      @user.save!
      UserMailer.create_and_deliver_password_change(@user, random_password).deliver
      reset_session
      redirect_to login_path
    else
      flash[:notice] = "Sorry, we can't find your account. Sign up!"
      redirect_to signup_path
    end
  end

  private 
    # protects env['omniauth.auth'] hash info by placing it inside private method
    def auth_hash
      request.env['omniauth.auth']
    end
end
