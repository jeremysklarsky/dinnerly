class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      if session[:dinner_path]
        # binding.pry
        redirect_to session[:dinner_path]
      else
        redirect_to user_path(@user)
      end
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end


  def update
    @user = current_user
    binding.pry
    if !!@user.authenticate(params[:user][:password])
      binding.pry
      @user.name = params[:user][:name]
      @user.email = params[:user][:email]
      if !params[:user][:new_password].empty? 
        @user.password = params[:user][:new_password]
        @user.password_confirmation = params[:user][:confirm_password]
        if @user.save
          flash[:notice] = "User details updated."
        else
          flash[:notice] = "Please confirm new password."
        end
      else
        binding.pry
        @user.save
        flash[:notice] = "User details updated."
      end
    else
      binding.pry
      flash[:notice] = "Incorrect password. No User details updated. Click below to reset your password."
    end
    render 'edit'
  end 

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
