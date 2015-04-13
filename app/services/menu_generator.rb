class MenuGenerator

  attr_accessor :menu_params, :menu

  def initialize(menu_params)
    @menu_params = menu_params
    @menu = Menu.create
  end

  def call
    cuisines =[]
    cuisines_no_surprises = Cuisine::CUISINES.dup
    cuisines_no_surprises.delete('-Surprise Me!-')
    @cuisine_keys = cuisines_no_surprises.keys

    if @menu_params['cuisine1'] != "-Surprise Me!-"
      cuisines << Cuisine::CUISINES[@menu_params['cuisine1']]
    else
      3.times do 
        surprise_cuisine = Cuisine::CUISINES[@cuisine_keys.sample]
        cuisines << surprise_cuisine
      end

    end

    if @menu_params['cuisine2'] != "-Surprise Me!-"
      cuisines << Cuisine::CUISINES[@menu_params['cuisine2']]
    else
      3.times do 
        surprise_cuisine = Cuisine::CUISINES[@cuisine_keys.sample]
        cuisines << surprise_cuisine
      end
    end
    
    @cuisines = cuisines.flatten.uniq

    num_appetizers = @menu_params['appetizers'].to_i * 2
    num_sides = @menu_params['sides'].to_i * 2
    num_mains = @menu_params['mains'].to_i * 2
    num_desserts = @menu_params['desserts'].to_i * 2
  
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
    @menu
  end

end