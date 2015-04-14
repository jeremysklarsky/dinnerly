class Cuisine < ActiveRecord::Base

  # has_many :recipe_cuisines
  has_many :recipes #through: :recipe_cuisines

  CUISINES = {"-Surprise Me!-" => ["Surprise Me!"],
              "Mexican" =>  ["Mexican", "Tex-Mex"],
              "Italian" =>  ["Italian"],
              "American" =>  ["American", "American-South", "Amerivan"],
              "African" =>  ["African"],
              "Hungarian" =>  ["Hungary"],
              "Southern" => ["American-South"],
              "Hawaiian" =>  ["Hawaiian"],
              "English" =>  ["English"],
              "Asian" =>  ["Asian"],
              "Chinese" =>  ["Chinese", "Chinese-canadian"],
              "Middle Eastern" => ["Middle Eastern", "Lebanese"],
              "South African" => ["South African"],
              "Thai" =>  ["Thai"],
              "French" =>  ["French"], 
              "Vegetarian" => ["Vegetarian"], 
              "Indian" => ["Indian"],
              "Mediterranean" => ["Mediterranean"]}

end
