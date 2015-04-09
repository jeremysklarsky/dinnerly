class AddBooleansToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :appetizer, :boolean, :default => false
    add_column :recipes, :main, :boolean, :default => false
    add_column :recipes, :side, :boolean, :default => false
    add_column :recipes, :dessert, :boolean, :default => false
  end
end
