class Course < ActiveRecord::Base

  has_many :recipe_courses
  has_many :recipes, through: :recipe_courses

  COURSES = { "Appetizers" =>  ["Appetizers", "Appetizers - Other", "Salad", "Green Salads", "Salads - Other", "Soup", "Dumplings", "Chowders"],
              "Main Dishes" =>  ["Main Dish", "Pasta", "Meatloaf", "Tacos, Burritos and Enchiladas", "Meat - Steaks and Chops", "Burgers", "Soups, Stews and Chili", "Fish and Shellfish", "Grill and BBQ", "Meatless", "Chili", "Stir-Fries"],
              "Side Dishes" =>  ["Rice", "Salad", "Potato Salads", "Grains", "Beans and Legumes", "Vegetable", "Casseroles", "Pasta", "Vegetable Salads"],
              "Desserts" =>  ["Cookies", "Desserts", "Desserts - Other", "Frozen Treats", "Custards and Puddings"]
            }
end
