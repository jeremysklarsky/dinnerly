class User < ActiveRecord::Base
 attr_accessor :random_password

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

  def self.create_with_omniauth(auth)
    self.create do |user|
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.oauth_token = auth["credentials"]["token"]
      user.password = User.random_password
      user.password_confirmation = user.password
    end
  end

  def self.random_password
    Array.new(10).map { (65 + rand(58)).chr }.join
  end

  def self.handle_facebook_login(auth_hash)
    self.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || self.create_with_omniauth(auth_hash)  

  end


end
