class CreateRecipeCourses < ActiveRecord::Migration
  def change
    create_table :recipe_courses do |t|
      t.integer :recipe_id
      t.integer :course_id
      t.timestamps null: false
    end

    add_index :recipe_courses, :recipe_id
    add_index :recipe_courses, :course_id
    add_index :recipe_courses, [:recipe_id, :course_id], unique: true


  end
end
