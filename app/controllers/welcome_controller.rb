class WelcomeController < ApplicationController
  def index
    if !current_user
      render 'index'
    else
      redirect_to user_path(current_user)
    end
  end
end
