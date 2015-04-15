class Menu < ActiveRecord::Base

  belongs_to :dinner
  delegate :host, to: :dinner
  has_many :menu_recipes
  has_many :recipes, through: :menu_recipes

  

  def appetizers
    self.menu_recipes.where(course_name: "Appetizer").collect {|mr| mr.recipe}
  end

  def sides
    self.menu_recipes.where(course_name: "Side").collect {|mr| mr.recipe}
  end

  def mains
    self.menu_recipes.where(course_name: "Main").collect {|mr| mr.recipe}
  end

  def desserts
    self.menu_recipes.where(course_name: "Dessert").collect {|mr| mr.recipe}
  end

  def menu_appetizers
    self.menu_recipes.where(course_name: "Appetizer").collect {|mr| mr}
  end

  def menu_sides
    self.menu_recipes.where(course_name: "Side").collect {|mr| mr}
  end

  def menu_mains
    self.menu_recipes.where(course_name: "Main").collect {|mr| mr}
  end

  def menu_desserts
    self.menu_recipes.where(course_name: "Dessert").collect {|mr| mr}
  end
end
