class DropRecipeIngredientsTable < ActiveRecord::Migration
  def change
    drop_table :recipe_ingredients
    drop_table :ingredients
  end
end
