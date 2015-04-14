class Course < ActiveRecord::Base

  has_many :recipe_courses
  has_many :recipes, through: :recipe_courses

  COURSES = { "Appetizers" =>  ["Appetizers", "Appetizers - Other","Dumplings", "Chowders", "Wraps and Rolls", "Cheese", "Meat", "Snacks for Kids", "Beans and Legumes", "Dips and Spreads", "Canapes and Bruschetta"],
    "Main Dishes" =>  ["Main Dish", "Pasta", "Meatloaf", "Tacos, Burritos and Enchiladas", "Meat - Steaks and Chops", "Burgers", "Soups, Stews and Chili", "Soups and Stews - Other", "Beans and Legumes","Fish and Shellfish", "Roasts", "Poultry - Chicken", "Pizza and Calzones" ],
    "Side Dishes" =>  ["Side Dish","Side Dish - Other", "Casseroles", "Pasta", "Bread", "White Bread", "Breads - Other", "Cornbread", "Salad", "Potato Salads", "Green Salads", "Grains"],
    "Desserts" => ["Desserts", "Desserts - Other","Custards and Puddings","Chocolate", "Shakes and Floats"]
}
end









