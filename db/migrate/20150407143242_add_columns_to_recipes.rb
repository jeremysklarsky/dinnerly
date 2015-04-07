class AddColumnsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes,  :cuisine, :string
    add_column :recipes,  :primary_ingredient, :string
    add_column :recipes,  :rating, :float
    add_column :recipes,  :image_url, :string
    add_column :recipes,  :review_count, :integer
    add_column :recipes,  :cook_time, :integer
    add_column :recipes,  :servings, :string
  end
end
