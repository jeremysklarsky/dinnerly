class MenusController < ApplicationController

  def create
    @dinner = Dinner.find(params[:dinner_id])
    @dinner.menu = MenuGenerator.new(params['menu']).call

    if @dinner.save
      respond_to do |format|
        format.js
        format.html
      end
    else
      render 'dinners/show'
    end
  end
  
  def update
    @menu = Menu.find(params[:id])
    @dinner = @menu.dinner
    @options = @menu.recipes.collect{|r|r.id}
    @choices = params["menu"]["recipes"].map(&:to_i)

    (@options - @choices).each do |reject|
      @menu.menu_recipes.find_by(recipe_id: reject).destroy
    end

    @menu.finalized = true
    @menu.save
    respond_to do |f|
      f.js
    end
  end
end