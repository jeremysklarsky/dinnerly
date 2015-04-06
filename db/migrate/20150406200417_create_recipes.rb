class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :source_url
      t.text :instructions
      t.timestamps null: false
    end
  end
end
