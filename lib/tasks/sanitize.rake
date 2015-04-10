class UpdateCourseNames
 COURSES = { "Appetizers" =>  ["Appetizers", "Appetizers - Other", "Salad", "Green Salads", "Salads - Other", "Soup", "Dumplings", "Chowders", "Dips and Spreads", "Cheese", "Canapes and Bruschetta"],
              "Main Dishes" =>  ["Marinades and Sauces", "Main Dish", "Pasta", "Meatloaf", "Tacos, Burritos and Enchiladas", "Meat - Steaks and Chops", "Burgers", "Soups, Stews and Chili", "Stews", "Fish and Shellfish", "Grill and BBQ", "Meatless", "Chili", "Stir-Fries", "Slow Cooker", "Sandwiches and Wraps", "Roasts", "Wraps and Rolls", "Poultry - Chicken", "Marinade"],
              "Side Dishes" =>  ["Potatoes", "Beans and Peas", "Side Dish", "Vegetables", "Rice", "Salad", "Potato Salads", "Grains", "Beans and Legumes", "Vegetable", "Casseroles", "Pasta", "Vegetable Salads", "Dips and Spreads", "Side Dish - Other", "Cornbread", "Yeast Bread", "White Bread", "Bread - Other"],
              "Desserts" =>  ["Desserts", "Desserts - Other", "Frozen Treats", "Custards and Puddings"]
            }
  
  def update
    @recipes = Recipe.all
    @recipes.each do |recipe|
      binding.pry
      if !(recipe.course_names & COURSES["Appetizers"]).empty?
        recipe.appetizer = true
      end
      if !(recipe.course_names & COURSES["Main Dishes"]).empty?
        recipe.main = true     
      end
      if !(recipe.course_names & COURSES["Side Dishes"]).empty?
        recipe.side = true     
      end
      if !(recipe.course_names & COURSES["Desserts"]).empty?
        recipe.dessert = true
      end
      recipe.save     
    end
  end
end




  # COURSES = { "Appetizers" =>  ["Appetizers", "Appetizers - Other", "Salad", "Green Salads", "Salads - Other", "Soup", "Dumplings", "Chowders"],
  #             "Main Dishes" =>  ["Main Dish", "Pasta", "Meatloaf", "Tacos, Burritos and Enchiladas", "Meat - Steaks and Chops", "Burgers", "Soups, Stews and Chili", "Fish and Shellfish", "Grill and BBQ", "Meatless", "Chili", "Stir-Fries", "Marinade"],
  #             "Side Dishes" =>  ["Rice", "Salad", "Potato Salads", "Grains", "Beans and Legumes", "Vegetable", "Casseroles", "Pasta", "Vegetable Salads"],
  #             "Desserts" =>  ["Desserts", "Desserts - Other", "Frozen Treats", "Custards and Puddings"]
  #           }
