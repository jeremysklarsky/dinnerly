class RemoveIndexFromMenuRecipes < ActiveRecord::Migration
  def change
    remove_index(:menu_recipes, :name => 'index_menu_recipes_on_menu_id_and_recipe_id')
  end
end
