class Cuisine < ActiveRecord::Base

  # has_many :recipe_cuisines
  has_many :recipes #through: :recipe_cuisines

  CUISINES = {"Surprise Me!" => "Surprise Me!",
              "Mexican" =>  "Mexican",
              "Italian" =>  "Italian",
              "American" =>  "American",
              "African" =>  "African",
              "Hungary" =>  "Hungary",
              "Southern" => "American-South",
              "Hawaiian" =>  "Hawaiian",
              "Brazilian" =>  "Brazilian",
              "English" =>  "English",
              "Japanese" =>  "Japanese",
              "Asian" =>  "Asian",
              "Chinese-canadian" => "Chinese-canadian",
              "Spanish" =>  "Spanish",
              "American" =>  "american",
              "Chinese" =>  "Chinese",
              "Caribbean" =>  "Caribbean",
              "Middle Eastern" => "Middle Eastern",
              "South African" => "South African",
              "Greek" =>  "Greek",
              "German" =>  "German",
              "Thai" =>  "Thai",
              "French" =>  "French"}

end
