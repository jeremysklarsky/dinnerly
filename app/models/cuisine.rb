class Cuisine < ActiveRecord::Base

  # has_many :recipe_cuisines
  has_many :recipes #through: :recipe_cuisines

  CUISINES = {"-Surprise Me!-" => ["Surprise Me!"],
              "Mexican" =>  ["Mexican"],
              "Italian" =>  ["Italian"],
              "American" =>  ["American"],
              "Asian" =>  ["Asian"],
              "Spanish" =>  ["Spanish"],
              "Vegan" => ["Vegan"],
              "Greek" =>  ["Greek"],
              "Western-Style" => ["Western-Style"],
              "Mediterranean" => ["Mediterranean"],
              "German" =>  ["German"],
              "French" =>  ["French"]}

              

end
