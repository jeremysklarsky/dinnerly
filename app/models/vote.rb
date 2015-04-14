class Vote < ActiveRecord::Base

  belongs_to :user
  belongs_to :menu_recipe

end
