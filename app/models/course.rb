class Course < ActiveRecord::Base

  has_many :recipe_courses
  has_many :recipes, through: :recipe_courses

end
