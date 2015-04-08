class MenusController < ApplicationController

  def new
    @menu = Menu.new
    @dinner = Dinner.find(params[:dinner_id])
    @cuisines = Cuisine::CUISINES.keys.sort
  end

  def create
    @dinner = Dinner.find(params[:dinner_id])
    @dinner.build_menu(menu_params)
    if @dinner.save
      redirect_to "/users/#{current_user.id}/dinners/#{@dinner.id}"
    else
      render 'new'
    end
  end

  private
  def menu_params
    params.require(:menu).permit(:name)
  end
end
