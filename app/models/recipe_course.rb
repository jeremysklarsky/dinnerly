class RecipeCourse < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :course
end
