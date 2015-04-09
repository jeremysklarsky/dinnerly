class Recipe < ActiveRecord::Base

  has_many :menu_recipes
  has_many :menus, through: :menu_recipes
  has_many :recipe_courses
  has_many :courses, through: :recipe_courses
  # has_many :recipe_cuisines
  # has_many :cuisines, through: :recipe_cuisines
  belongs_to :cuisine

  def course_names
    self.courses.collect{|course| course.name}
  end
  
end


