class Cuisine < ActiveRecord::Base

  # has_many :recipe_cuisines
  has_many :recipes #through: :recipe_cuisines

end
