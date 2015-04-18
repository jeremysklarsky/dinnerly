class MenusController < ApplicationController

  def create
    @dinner = Dinner.find(params[:dinner_id])
    @dinner.menu = MenuGenerator.new(params['menu']).call
    
    @dinner.menu.election = true if params[:menu][:election] == "Let my guests vote!" 
    @dinner.menu.save
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
    @choices = params["menu"]["recipes"].map(&:to_i)

    if (@choices - [0]).length < 4
      flash.now[:notice] = "Please choose at least one dish for each course."
    else
      binding.pry
      @options = @menu.recipes.collect{|r|r.id}
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

  def tally
    @menu = Menu.find(params[:id])
    @dinner = @menu.dinner
    @menu.tally_votes
    @menu.email_guests_with_final_menu(@dinner, current_user)

    respond_to do |f|
      f.js
    end
  end
end
