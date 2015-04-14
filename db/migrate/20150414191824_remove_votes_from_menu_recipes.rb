class RemoveVotesFromMenuRecipes < ActiveRecord::Migration
  def change
    remove_column :menu_recipes, :votes
  end
end
