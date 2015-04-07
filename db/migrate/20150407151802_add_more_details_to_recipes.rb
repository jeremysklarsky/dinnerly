class AddMoreDetailsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :string
    add_column :recipes, :big_oven_id, :string
  end
end
