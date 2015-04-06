class MenuRecipe < ActiveRecord::Base

  belongs_to :menu
  belongs_to :recipe
  belongs_to :chef, :class_name => "User"

end
