class MenusController < ApplicationController

  # def new
  #   @menu = Menu.new
  #   @dinner = Dinner.find(params[:dinner_id])
  #   @cuisines = Cuisine::CUISINES.keys.sort
  # end

  def create
    @dinner = Dinner.find(params[:dinner_id])
    @menu = @dinner.build_menu
    @dinner.save

    if params['menu']['cuisine1'] != "-Surprise Me!-"
      cuisines = Cuisine::CUISINES[params['menu']['cuisine1']]
    else
      cuisines_with_surprises = Cuisine::CUISINES.dup
      cuisines_with_surprises.delete['-Surprise Me!-']
      cuisine_keys = cuisines_with_surprises.keys
      cuisines = []
      3.times do 
        surprise_cuisine = cuisine_keys.sample
        cuisines << surprise_cuisine
        cuisines_with_surprises.delete[surprise_cuisine]
      end
    end

    if params['menu']['cuisine2'] != "-Surprise Me!-"
      cuisines << Cuisine::CUISINES[params['menu']['cuisine2']]
    else
      cuisines_with_surprises = Cuisine::CUISINES.dup
      cuisines_with_surprises.delete['-Surprise Me!-']
      cuisine_keys = cuisines_with_surprises.keys
      3.times do 
        surprise_cuisine = cuisine_keys.sample
        cuisines << surprise_cuisine
        cuisines_with_surprises.delete[surprise_cuisine]
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
      recipe = Cuisine.find_by(name: cuisines.sample).recipes.includes(:courses).where('courses.name = ?', appetizers.sample).references(:courses)
      binding.pry
      recipe.menu_recipes.build(menu_id: @menu.id, course_name: "Appetizer")
    end

    sides = Course::COURSES['Side Dishes']
    num_sides.times do
      recipe = Cuisine.find_by(name: cuisines.sample).recipes.includes(:courses).where('courses.name = ?', sides.sample).references(:courses)
      recipe.menu_recipes.build(menu_id: @menu.id, course_name: "Side")
    end

    mains = Course::COURSES['Main Dishes']
    num_mains.times do
      recipe = Cuisine.find_by(name: cuisines.sample).recipes.includes(:courses).where('courses.name = ?', mains.sample).references(:courses)
      recipe.menu_recipes.build(menu_id: @menu.id, course_name: "Main")
    end

    desserts = Course::COURSES['Desserts']
    num_desserts.times do
      recipe = Recipe.includes(:courses).where('courses.name = ?', desserts.sample).references(:courses)
      recipe.menu_recipes.build(menu_id: @menu.id, course_name: "Dessert")
    end

    if @dinner.save
      redirect_to "/users/#{current_user.id}/dinners/#{@dinner.id}"
    else
      render 'dinners/show'
    end
  end
end