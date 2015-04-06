class Dinner < ActiveRecord::Base

  has_many :dinner_guests
  has_many :guests, through: :dinner_guests
  belongs_to :host, :class_name => "User"
  has_one :menu

  validates_presence_of :host, :name, :datetime, :location

end
