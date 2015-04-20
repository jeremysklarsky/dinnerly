class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    dinner_url = request.referrer
    id = dinner_url.split("/").last.to_i
    @dinner = Dinner.find(id)
    @recipe = Recipe.new
    menu = @dinner.menu
    menu.recipes << @recipe
    # binding.pry
    @recipe.save
    # binding.pry
    menu.save
  end

  def update
   @recipe = Recipe.find(params[:id])
   @recipe.update(recipe_params)
   @menu = @recipe.menus.first
   determine_recipe_course(@recipe, @menu)
   @recipe.cuisine = Cuisine.find_or_create_by(name: params[:recipe][:cuisine])
   @recipe.save
   # binding.pry
   @dinner = @recipe.menus.first.dinner
   # binding.pry
   redirect_to user_dinner_path(@dinner.host, @dinner)
  end

  private

    def recipe_params
      params.require(:recipe).permit(:name, :description, :primary_ingredient, :cook_time, :servings, :ingredients, :instructions, :image_upload)
    end

    def determine_recipe_course(recipe, menu)
      if params[:recipe][:appetizer] == "appetizer"
        recipe.appetizer = true
        mr = MenuRecipe.create(recipe_id: recipe.id, menu_id: menu.id )
        mr.update(course_name: "Appetizer")
      elsif params[:recipe][:appetizer] == "main"
        recipe.main = true
        mr = MenuRecipe.create(recipe_id: recipe.id, menu_id: menu.id )
        mr.update(course_name: "Main")
      elsif params[:recipe][:appetizer] == "side"
        recipe.side = true
        mr = MenuRecipe.create(recipe_id: recipe.id, menu_id: menu.id )
        mr.update(course_name: "Side")
      else 
        recipe.dessert = true
        mr = MenuRecipe.create(recipe_id: recipe.id, menu_id: menu.id )
        mr.update(course_name: "Dessert")
      end
      recipe.save
    end

end
