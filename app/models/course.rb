class Course < ActiveRecord::Base

  has_many :recipe_courses
  has_many :recipes, through: :recipe_courses

  COURSES = { "Appetizers" =>  ["Appetizers", "Appetizers - Other", "Salad", "Green Salads", "Salads - Other", "Soup", "Dumplings", "Chowders", "Dips and Spreads", "Cheese", "Canapes and Bruschetta", "Wraps and Rolls"],
              "Main Dishes" =>  ["Pizza and Calzones", "Marinades and Sauces", "Main Dish", "Pasta", "Meatloaf", "Tacos, Burritos and Enchiladas", "Meat - Steaks and Chops", "Burgers", "Soups, Stews and Chili", "Stews", "Fish and Shellfish", "Grill and BBQ", "Meatless", "Chili", "Stir-Fries", "Slow Cooker", "Sandwiches and Wraps", "Roasts", "Wraps and Rolls", "Poultry - Chicken", "Marinade", "Meat", "Slow Cooker Soups
", "Meat and Poultry", "Seafood non-chowder", "Meat - Other", "Main Dish - Other"],
              "Side Dishes" =>  ["Pasta Salads", "Potatoes", "Beans and Peas", "Side Dish", "Vegetables", "Rice", "Salad", "Potato Salads", "Grains", "Beans and Legumes", "Vegetable", "Casseroles", "Pasta", "Vegetable Salads", "Dips and Spreads", "Side Dish - Other", "Cornbread", "Yeast Bread", "White Bread", "Bread - Other", "Side Dish"],
              "Desserts" =>  ["Desserts", "Desserts - Other", "Frozen Treats", "Custards and Puddings"]
            }
end









