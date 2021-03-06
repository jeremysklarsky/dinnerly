class MenuRecipesController < ApplicationController
  before_action :can_vote?, only: [:vote]

  def chef
    @menu_recipe = MenuRecipe.find(params[:id])
    @menu_recipe.chef_id = current_user.id
    @menu_recipe.save

    @current_user = current_user.name
    @chef_button = "#chef_#{params[:id]}"
    @chef_name = "#chef_name_#{params[:id]}"

    respond_to do |f|
      f.js
    end
  end

  def unchef
    @menu_recipe = MenuRecipe.find(params[:id])
    @menu_recipe.chef_id = nil
    @menu_recipe.save

    @chef_button = "#chef_#{params[:id]}"
    @chef_name = "#chef_name_#{params[:id]}"

    respond_to do |f|
      f.js
    end
  end

  def vote
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

  def unvote
    @menu_recipe = MenuRecipe.find(params[:id])
    @num_votes = "#num_votes_#{@menu_recipe.id}"
    @vote_button = "#vote_#{@menu_recipe.id}"
    @user = current_user
    @vote = Vote.find_by(user_id: @user.id, menu_recipe_id: @menu_recipe.id)
    @vote.destroy if @vote
    respond_to do |f|
      f.js 
    end
  end

  private

  def can_vote?
    user = current_user
    menu_recipe = MenuRecipe.find(params[:id])
    course_name = menu_recipe.course_name
    menu = menu_recipe.menu
    recipes = menu.menu_recipes.where("course_name = ?", course_name)
    vote_limit = recipes.count / 2
    total_course_votes = recipes.collect {|r| r.votes}.flatten
    total_user_votes = total_course_votes.select {|v| v.user_id == user.id}.size

    if total_user_votes >= vote_limit
      session[:alert] = 'raise alert'
    else
      session[:alert] = nil
    end
  end

end
