class Dinner < ActiveRecord::Base

  has_many :dinner_guests
  has_many :guests, through: :dinner_guests
  belongs_to :host, :class_name => "User"
  has_one :menu
  has_many :recipes, through: :menu

  validates_presence_of :host_id, :name, :datetime, :location

end
