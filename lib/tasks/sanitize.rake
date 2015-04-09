desc "Assigns boolean values to recipe courses"
task :sanitize => :environment do 

  @recipes = Recipe.all
  @recipes.each do |recipe|
    if !(recipe.course_names & Course::COURSES["Appetizers"]).empty?
      recipe.appetizer = true
    end
    if !(recipe.course_names & Course::COURSES["Main Dishes"]).empty?
      recipe.main = true     
    end
    if !(recipe.course_names & Course::COURSES["Side Dishes"]).empty?
      recipe.side = true     
    end
    if !(recipe.course_names & Course::COURSES["Desserts"]).empty?
      recipe.dessert = true
    end
    recipe.save     
  end
end


  # COURSES = { "Appetizers" =>  ["Appetizers", "Appetizers - Other", "Salad", "Green Salads", "Salads - Other", "Soup", "Dumplings", "Chowders"],
  #             "Main Dishes" =>  ["Main Dish", "Pasta", "Meatloaf", "Tacos, Burritos and Enchiladas", "Meat - Steaks and Chops", "Burgers", "Soups, Stews and Chili", "Fish and Shellfish", "Grill and BBQ", "Meatless", "Chili", "Stir-Fries"],
  #             "Side Dishes" =>  ["Rice", "Salad", "Potato Salads", "Grains", "Beans and Legumes", "Vegetable", "Casseroles", "Pasta", "Vegetable Salads"],
  #             "Desserts" =>  ["Desserts", "Desserts - Other", "Frozen Treats", "Custards and Puddings"]
  #           }
