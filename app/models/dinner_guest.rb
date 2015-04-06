class DinnerGuest < ActiveRecord::Base

  belongs_to :dinner
  belongs_to :guest, :class_name => "User"

end
