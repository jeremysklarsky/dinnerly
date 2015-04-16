  class User < ActiveRecord::Base
  
  validates_uniqueness_of :email
  validates_presence_of :name, :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_secure_password
  validates :password, 
         # you only need presence on create
         :presence => { :on => :create },
         # allow_nil for length (presence will handle it on create)
         :length   => { :minimum => 6, :allow_nil => true },
         # and use confirmation to ensure they always match
         :confirmation => true

  has_many :dinners, foreign_key: 'host_id', dependent: :destroy
  has_many :dinner_guests, foreign_key: 'guest_id'
  has_many :attended_dinners, foreign_key: 'guest_id', class_name: 'DinnerGuest'
  has_many :menus, through: :dinners
  has_many :menu_recipes, foreign_key: 'chef_id'
  has_many :recipes, through: :menu_recipes
  has_many :votes

  def attending?(dinner)
    if dinner.guests.include?(self)
      "Yes"
    else
      "No"
    end
  end

end

