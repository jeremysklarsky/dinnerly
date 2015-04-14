class MenuRecipesController < ApplicationController
  before_action :can_vote?, only: [:vote]

  def update
    @menu = Menu.find(params[:menu_recipe][:menu_id])
    @menu_recipe = MenuRecipe.find_by(:recipe_id => params[:menu_recipe][:recipe_id], :menu_id => params[:menu_recipe][:menu_id])
    @menu_recipe.chef_id = current_user.id
    @menu_recipe.save

    @current_user = current_user.name
    @id = "#edit_menu_recipe_#{@menu_recipe.id}"

    respond_to do |f|
      f.js
    end 
  end

  def vote
    binding.pry
    @menu_recipe = MenuRecipe.find(params[:id])
    unless session[:alert]
      @menu_recipe.votes.build(:user_id => current_user.id)
      @menu_recipe.save
      @num_votes = "#num_votes_#{@menu_recipe.id}"
      @vote_button = "#vote_#{@menu_recipe.id}"
    end
    respond_to do |f|
      f.js 
    end
  end

  private

  def can_vote?
    # binding.pry
    user = current_user
    menu_recipe = MenuRecipe.find(params[:id])
    course_name = menu_recipe.course_name
    menu = menu_recipe.menu 
    recipes = menu.menu_recipes.where("course_name = ?", course_name)
    vote_limit = recipes.count / 2
    total_course_votes = recipes.collect {|r| r.votes}.flatten
    total_user_votes = total_course_votes.select {|v| v.user_id == user.id}.size
    binding.pry
    if total_user_votes >= vote_limit
      session[:alert] = "raise alert"
    else
      session[:alert] = nil
    end
 

  end

end