class Menu < ActiveRecord::Base

  belongs_to :dinner
  delegate :host, to: :dinner
  has_many :menu_recipes
  has_many :recipes, through: :menu_recipes

  

end
