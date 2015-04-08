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
        # 
        surprise_cuisine = Cuisine::CUISINES[@cuisine_keys.sample]
        cuisines << surprise_cuisine
        # cuisines_no_surprises.delete(surprise_cuisine)
      end

    end

    if params['menu']['cuisine2'] != "-Surprise Me!-"
      cuisines << Cuisine::CUISINES[params['menu']['cuisine2']]
    else
      3.times do 
        # 
        surprise_cuisine = Cuisine::CUISINES[@cuisine_keys.sample]
        cuisines << surprise_cuisine
        # cuisines_no_surprises.delete(surprise_cuisine)
      end
    end
    
    @cuisines = cuisines.flatten.uniq


    # to abstract all of this!
    num_appetizers = params['menu']['appetizers'].to_i * 2
    num_sides = params['menu']['sides'].to_i * 2
    num_mains = params['menu']['mains'].to_i * 2
    num_desserts = params['menu']['desserts'].to_i * 2

    appetizers = Course::COURSES['Appetizers']
    
    num_appetizers.times do
      @appetizer_recipes = Cuisine.find_by(name: @cuisines.sample).recipes.includes(:courses).where('courses.name = ?', appetizers.sample).references(:courses)
      
      i = 0
        while @appetizer_recipes.empty? && i < @cuisines.length
          @appetizer_recipes = Cuisine.find_by(name: @cuisines[i]).recipes.includes(:courses).where('courses.name = ?', appetizers.sample).references(:courses)
          i+=1
        end
      binding.pry
      while @appetizer_recipes.empty?

        @appetizer_recipes = Recipe.includes(:courses).where('courses.name = ?', appetizers.sample).references(:courses) 
      end

      @appetizer_recipe = @appetizer_recipes.sample 
      binding.pry
      until !@menu.recipes.include?(@appetizer_recipe)
        @appetizer_recipe = @appetizer_recipes.sample
      end

      MenuRecipe.create(menu_id: @menu.id, recipe_id: @appetizer_recipe.id, course_name: "Appetizer")
      @menu.reload

    end
  
    sides = Course::COURSES['Side Dishes']
      num_sides.times do
      @side_recipes = Cuisine.find_by(name: @cuisines.sample).recipes.includes(:courses).where('courses.name = ?', sides.sample).references(:courses)
      
      i = 0
        while @side_recipes.empty? && i < @cuisines.length
          @side_recipes = Cuisine.find_by(name: @cuisines[i]).recipes.includes(:courses).where('courses.name = ?', sides.sample).references(:courses)
          i+=1
        end
      
      @side_recipes = Recipe.includes(:courses).where('courses.name = ?', sides.sample).references(:courses) until !@side_recipes.empty?

      @side_recipe = @side_recipes.sample 

      until !@menu.recipes.include?(@side_recipe)
        @side_recipe = @side_recipes.sample
      end

      MenuRecipe.create(menu_id: @menu.id, recipe_id: @side_recipe.id, course_name: "Side")
      @menu.reload
    end

    


    mains = Course::COURSES['Main Dishes']
      num_mains.times do
      @main_recipes = Cuisine.find_by(name: @cuisines.sample).recipes.includes(:courses).where('courses.name = ?', mains.sample).references(:courses)
      
      i = 0
        while @main_recipes.empty? && i < @cuisines.length
          @main_recipes = Cuisine.find_by(name: @cuisines[i]).recipes.includes(:courses).where('courses.name = ?', mains.sample).references(:courses)
          i+=1
        end
      
      @main_recipes = Recipe.includes(:courses).where('courses.name = ?', mains.sample).references(:courses) until !@main_recipes.empty?

      @main_recipe = @main_recipes.sample 

      until !@menu.recipes.include?(@main_recipe)
        @main_recipe = @main_recipes.sample
      end

      MenuRecipe.create(menu_id: @menu.id, recipe_id: @main_recipe.id, course_name: "Main")
      @menu.reload
    end

        


    desserts = Course::COURSES['Desserts']

    num_desserts.times do
      
      @dessert_recipe = Recipe.includes(:courses).where('courses.name = ?', desserts.sample).references(:courses).sample

      until !@menu.recipes.include?(@dessert_recipe)
        @dessert_recipe = Recipe.includes(:courses).where('courses.name = ?', desserts.sample).references(:courses).sample
      end

      MenuRecipe.create(menu_id: @menu.id, recipe_id: @dessert_recipe.id, course_name: "Dessert")
      
      @menu.reload

    end


    if @dinner.save
      redirect_to "/users/#{current_user.id}/dinners/#{@dinner.id}"
    else
      render 'dinners/show'
    end
  end
end