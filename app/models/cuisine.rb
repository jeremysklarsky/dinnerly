class Cuisine < ActiveRecord::Base

  # has_many :recipe_cuisines
  has_many :recipes #through: :recipe_cuisines

  CUISINES = {"-Surprise Me!-" => ["Surprise Me!"],
    "Mexican" =>  ["Mexican", "Tex-Mex"],
    "Italian" =>  ["Italian"],
    "American" =>  ["American", "American-South", "Tex-Mex", "american","Hawaiian"],
    "African" => ["African"],
    "Asian" =>  ["Asian", "Japanese", "Chinese"],
    "Hungary" => ["Hungary"],
    "Spanish" =>  ["Spanish"],
    "Greek" =>  ["Greek"],
    "German" =>  ["German"],
    "French" =>  ["French"],
    "Jewish" => ["Jewish"],
    "Indian" => ["Indian", "indian"],
    "Middle Eastern" => ["Middle Eastern"],
    "Brazilian" => ["Brazilian"],
    "Australian" => ["Australian"],
    "Japanese" => ["Japanese"],
    "English" => ["English"],
    "Chinese" => ["Chinese", "Chinese-canadian"],
    "Thai" => ["Thai"],
    "Hawaiian" => ["Hawaiian"],
    "Irish" => ["Irish"]}

end
