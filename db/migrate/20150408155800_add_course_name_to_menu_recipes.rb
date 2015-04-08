class AddCourseNameToMenuRecipes < ActiveRecord::Migration
  def change
    add_column :menu_recipes, :course_name, :string
  end
end
