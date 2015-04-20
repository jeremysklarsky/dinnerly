require 'fastimage'

module ApplicationHelper

  def valid_image_url(recipe)
    if FastImage.size(recipe.image_url)
      recipe.image_url
    else
      "http://ctbnutrition.com/wp-content/uploads/2015/03/Vegetable-Question-Mark.jpg"
    end
  end
end
