class MenusController < ApplicationController

  def create
    @dinner = Dinner.find(params[:dinner_id])
    @menu = @dinner.build_menu
    @dinner.save
    cuisines =[]
    cuisines_no_surprises = Cuisine::CUISINES.dup
    cuisines_no_surprises.delete('-Surprise Me!-')
    @cuisine_keys = cuisines_no_surprises.keys

    if params['menu']['cuisine1'] != "-Surprise Me!-"
      cuisines << Cuisine::CUISINES[params['menu']['cuisine1']]
    else
      3.times do 
        surprise_cuisine = Cuisine::CUISINES[@cuisine_keys.sample]
        cuisines << surprise_cuisine
      end

    end

    if params['menu']['cuisine2'] != "-Surprise Me!-"
      cuisines << Cuisine::CUISINES[params['menu']['cuisine2']]
    else
      3.times do 
        surprise_cuisine = Cuisine::CUISINES[@cuisine_keys.sample]
        cuisines << surprise_cuisine
      end
    end
    
    @cuisines = cuisines.flatten.uniq

    num_appetizers = params['menu']['appetizers'].to_i * 2
    num_sides = params['menu']['sides'].to_i * 2
    num_mains = params['menu']['mains'].to_i * 2
    num_desserts = params['menu']['desserts'].to_i * 2
  
    @appetizer_recipes = []
    @side_recipes = []
    @main_recipes = []
    @menu_recipes = []
    @dessert_recipes = Recipe.where('dessert = true')

    @menu_recipes += @dessert_recipes  

    @cuisines.each do |c|
      @appetizer_recipes += Cuisine.find_by(name: c).recipes.where('appetizer = true').select{|recipe|!@menu_recipes.include?(recipe)} #if !Cuisine.find_by(name: c).recipes.where('appetizer = true').empty?
      @menu_recipes += @appetizer_recipes
      @side_recipes += Cuisine.find_by(name: c).recipes.where('side = true').select{|recipe|!@menu_recipes.include?(recipe)} #if !Cuisine.find_by(name: c).recipes.where('side = true').empty?
      @menu_recipes += @side_recipes
      @main_recipes += Cuisine.find_by(name: c).recipes.where('main = true').select{|recipe|!@menu_recipes.include?(recipe)} #if !Cuisine.find_by(name: c).recipes.where('main = true').empty?
      @menu_recipes += @main_recipes
    end

    @appetizer_recipes.uniq!
    @side_recipes.uniq!
    @main_recipes.uniq!

    until @appetizer_recipes.length >= num_appetizers
      recipe = Recipe.where('appetizer = true').sample 
      @appetizer_recipes << recipe unless @appetizer_recipes.include?(recipe) || @menu_recipes.include?(recipe)  
    end
    
    @menu_recipes += @appetizer_recipes

    until @side_recipes.length >= num_sides
      recipe = Recipe.where('side = true').sample 
      @side_recipes << recipe unless @side_recipes.include?(recipe) || @menu_recipes.include?(recipe)  
    end
      
    @menu_recipes += @side_recipes

    until @main_recipes.length >= num_mains
      recipe = Recipe.where('main = true').sample 
      @main_recipes << recipe unless @main_recipes.include?(recipe) || @menu_recipes.include?(recipe)      
    end
    @menu_recipes += @main_recipes

    @appetizer_recipes.sample(num_appetizers).each do |recipe|  
      MenuRecipe.create(menu_id: @menu.id, recipe_id: recipe.id, course_name: "Appetizer")
    end
      
    @side_recipes.compact.sample(num_sides).each do |recipe|    
      MenuRecipe.create(menu_id: @menu.id, recipe_id: recipe.id, course_name: "Side")
    end

    @main_recipes.compact.sample(num_mains).each do |recipe|    
      MenuRecipe.create(menu_id: @menu.id, recipe_id: recipe.id, course_name: "Main")
    end

    @dessert_recipes.sample(num_desserts).each do |recipe|    
      MenuRecipe.create(menu_id: @menu.id, recipe_id: recipe.id, course_name: "Dessert")
    end    

    @menu.save
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