class Users::DinnersController < ApplicationController

  def new
    @dinner = Dinner.new
  end

  def create
    # binding.pry
    @dinner = Dinner.new(name: params[:dinner][:name], location: params[:dinner][:location], datetime: params[:dinner][:datetime], host_id: params[:user_id]) 
    if @dinner.save
      # binding.pry
      redirect_to "/users/#{current_user.id}/dinners/#{@dinner.id}"
    else
      flash.now[:notice] = "That didn't work!"
      render :new
    end

  end

  def show
    @dinner = Dinner.find(params[:id])
  end
end
