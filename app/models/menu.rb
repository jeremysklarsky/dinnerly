class Menu < ActiveRecord::Base

  belongs_to :dinner
  belongs_to :host, through: :dinner
  has_many :menu_recipes
  has_many :recipes, through: :menu_recipes

end
