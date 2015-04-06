class Course < ActiveRecord::Base

  has_many :recipe_courses
  has_many :courses, through: :recipe_courses

end
