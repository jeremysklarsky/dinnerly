class MenuGenerator

  attr_accessor :menu_params, :menu, :cuisines

  def initialize(menu_params)
    @menu_params = menu_params
    @menu = Menu.create
    @appetizer_recipes = []
    @side_recipes = []
    @main_recipes = []
    @menu_recipes = []
    @course_recipes_array = [@appetizer_recipes, @side_recipes, @main_recipes]
    @dessert_recipes = Recipe.where('dessert = true')
  end

  def call
    create_cuisine_list
    set_course_numbers
    add_to_menu_recipe_array(@dessert_recipes)  
    
    @cuisines.each do |cuisine|
      #course_recipes, #db_course_name
      create_menu_options(@appetizer_recipes, 'appetizer', cuisine)
      create_menu_options(@side_recipes, 'side', cuisine)
      create_menu_options(@main_recipes, 'main', cuisine)
    end

    @course_recipes_array.each{|course_recipes|course_recipes.uniq!}

    finalize_menu_recipes(@appetizer_recipes, @num_appetizers, 'appetizer')
    finalize_menu_recipes(@side_recipes, @num_sides, 'side')
    finalize_menu_recipes(@main_recipes, @num_mains, 'main')
    
    build_menu_recipes(@appetizer_recipes, @num_appetizers, "Appetizer")
    build_menu_recipes(@side_recipes, @num_sides, "Side")
    build_menu_recipes(@main_recipes, @num_mains, "Main")
    build_menu_recipes(@dessert_recipes, @num_desserts, "Dessert")
    binding.pry
    @menu.exp_date = params[:menu][:exp_date]
    @menu.save
    @menu
  end


  def set_course_numbers
    @num_appetizers = self.menu_params['appetizers'].to_i * 2
    @num_sides = self.menu_params['sides'].to_i * 2
    @num_mains = self.menu_params['mains'].to_i * 2
    @num_desserts = self.menu_params['desserts'].to_i * 2
  end

  def create_cuisine_list
    cuisines =[]
    cuisines_no_surprises = Cuisine::CUISINES.dup
    cuisines_no_surprises.delete('-Surprise Me!-')
    @cuisine_keys = cuisines_no_surprises.keys

    2.times do |i|
      if @menu_params["cuisine#{i}"] != "-Surprise Me!-"
        cuisines << Cuisine::CUISINES[@menu_params["cuisine#{i}"]]
      else
        3.times do 
          surprise_cuisine = Cuisine::CUISINES[@cuisine_keys.sample]
          cuisines << surprise_cuisine
        end

      end
    end
    
    @cuisines = cuisines.flatten.uniq
    @cuisines.delete_if {|c| c.nil?}
  end

  def build_menu_recipes(course_recipes, num_courses, name)
    course_recipes.sample(num_courses).each do |recipe|  
      MenuRecipe.create(menu_id: @menu.id, recipe_id: recipe.id, course_name: name)
    end
  end

  def sufficient_courses?(course_recipes, num_courses)
    course_recipes.length >= num_courses
  end

  def finalize_menu_recipes(course_recipes, num_courses, course_name)
    add_random_recipes(course_recipes, course_name) until sufficient_courses?(course_recipes, num_courses)
  end

  def add_to_menu_recipe_array(course_recipes)
    @menu_recipes += course_recipes
  end

  def add_random_recipes(course_recipes, course_name)
    recipe = Recipe.where("#{course_name} = true").sample 
    course_recipes << recipe unless course_recipes.include?(recipe) || @menu_recipes.include?(recipe)  
  end

  def create_menu_options(course_recipes, course_name, cuisine)
    course_recipes += Cuisine.find_by(name: cuisine).recipes.where("#{course_name} = true").select{|recipe|!@menu_recipes.include?(recipe)} 
    add_to_menu_recipe_array(course_recipes)   
  end

end