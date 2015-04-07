class SessionsController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    binding.pry
    @user = User.find_by(:email => params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user 
      login(@user)
      flash[:notice] = "Successfully logged in. Welcome #{@user.name}!"
      redirect_to '/'
    else
      binding.pry
      flash.now[:notice] = "User name or password is not valid."
      render 'new'
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end

end
