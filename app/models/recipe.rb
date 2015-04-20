require "net/http"

class Recipe < ActiveRecord::Base
  has_many :menu_recipes
  has_many :menus, through: :menu_recipes
  has_many :recipe_courses
  has_many :courses, through: :recipe_courses
  belongs_to :cuisine
  after_create :assign_course_names

  has_attached_file :image_upload
  validates_attachment_content_type :image_upload, :content_type => /\Aimage\/.*\Z/
  
  def course_names
    self.courses.collect { |course| course.name }
  end

  def assign_course_names
    if !(self.course_names & Course::COURSES["Appetizers"]).empty?
      self.appetizer = true
    end
    if !(self.course_names & Course::COURSES["Main Dishes"]).empty?
      self.main = true
    end
    if !(self.course_names & Course::COURSES["Side Dishes"]).empty?
      self.side = true
    end
    if !(self.course_names & Course::COURSES["Desserts"]).empty?
      self.dessert = true
    end
    self.save
  end

  def recipe_card
    if !FastImage.size(self.image_url)
      self.image_url = "http://ctbnutrition.com/wp-content/uploads/2015/03/Vegetable-Question-Mark.jpg"
      self.save
    end
    ActionView::Base.new(
      Rails.configuration.paths["app/views"]).render(
      :partial => 'menus/recipe', :format => :txt,
      :locals => { :recipe => self })
  end

  def short_name
    if self.name.length > 35
      "#{self.name[0..32]}..."
    else
      self.name
    end
  end

end
