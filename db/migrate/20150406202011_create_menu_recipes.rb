class CreateMenuRecipes < ActiveRecord::Migration
  def change
    create_table :menu_recipes do |t|
      t.integer :menu_id
      t.integer :recipe_id
      t.integer :chef_id
      t.integer :votes
      t.timestamps null: false
    end

    add_index :menu_recipes, :menu_id
    add_index :menu_recipes, :recipe_id
    add_index :menu_recipes, [:menu_id, :recipe_id], unique: true

  end
end
