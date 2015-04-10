# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# name, list of ingredients, instructions, cuisine type(s), meal categories



keywords_list = ["dessert", "appetizer", "bread", "main dish", "salad", "side dish", "soup", "marinade", "pasta", "casserole", "rice", "risotto", "chicken", "beef", "fish", "lamb", "pork", "grilled"]


 #Rachel's key, dessert page 1
 #next: Rachel's key, dessert page 2


search_result = Unirest.get("http://api.bigoven.com/recipes?any_kw=#{keywords_list[1]}&api_key=#{ENV['big_oven_key']}&pg=1&rpp=30", headers:{ "Accept" => "application/json"})



recipe_ids = search_result.body["Results"].collect do |result|
  result["RecipeID"]
end

recipe_ids.each do |recipe_id|

  recipe_response = Unirest.get("http://api.bigoven.com/recipe/#{recipe_id}?api_key=#{ENV['big_oven_key']}", headers:{ "Accept" => "application/json"})
  if !Recipe.find_by(:big_oven_id => recipe_response.body["RecipeID"]) && ((recipe_response.body["Ingredients"] != "") && (recipe_response.body["Ingredients"] != nil)) && ((recipe_response.body["Instructions"] != "") && (recipe_response.body["Instructions"] != nil)) && ((recipe_response.body["Cuisine"] != "") && (recipe_response.body["Cuisine"] != nil))

    recipe = Recipe.new
    recipe.name = recipe_response.body["Title"]
    recipe.big_oven_id = recipe_response.body["RecipeID"]
    recipe.description = recipe_response.body["Description"]
    recipe.cuisine = Cuisine.find_or_create_by(:name => recipe_response.body["Cuisine"])
    recipe.primary_ingredient = recipe_response.body["PrimaryIngredient"]     
    recipe.rating = recipe_response.body["StarRating"]
    recipe.source_url = recipe_response.body["WebURL"]    
    recipe.image_url = recipe_response.body["ImageURL"]
    recipe.review_count = recipe_response.body["ReviewCount"]
    recipe.servings = "#{recipe_response.body["YieldNumber"]} #{recipe_response.body["YieldUnit"]}"
    recipe.cook_time = recipe_response.body["TotalMinutes"]
    recipe.ingredients = ""
    recipe_response.body["Ingredients"].each do |ingredient|
      recipe.ingredients << "#{ingredient['DisplayQuantity']} #{ingredient["Unit"]} #{ingredient["Name"]} * "
    end
    recipe.instructions = recipe_response.body["Instructions"].gsub("\r", "").gsub("\n", "")
    recipe.courses << Course.find_or_create_by(:name => recipe_response.body["Category"]) if !recipe.courses.include?(Course.find_by(:name =>recipe_response.body["Category"]))
    recipe.courses << Course.find_or_create_by(:name => recipe_response.body["Subcategory"]) if !recipe.courses.include?(Course.find_by(:name =>recipe_response.body["Subcategory"]))
    recipe.save
  end
end