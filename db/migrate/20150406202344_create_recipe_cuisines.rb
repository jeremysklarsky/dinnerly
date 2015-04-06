class CreateRecipeCuisines < ActiveRecord::Migration
  def change
    create_table :recipe_cuisines do |t|
      t.integer :recipe_id
      t.integer :cuisine_id

      t.timestamps null: false
    end

    add_index :recipe_cuisines, :recipe_id
    add_index :recipe_cuisines, :cuisine_id
    add_index :recipe_cuisines, [:recipe_id, :cuisine_id], unique: true

  end
end
