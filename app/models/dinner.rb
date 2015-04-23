class Dinner < ActiveRecord::Base
  has_many :dinner_guests
  has_many :guests, through: :dinner_guests
  belongs_to :host, :class_name => 'User'
  has_one :menu
  has_many :recipes, through: :menu
  validates_presence_of :host_id, :name, :date, :time, :location

  def invited_guests
    emails = self.guest_emails.split(',')
    invited_guests_array = [self.host.email]
    emails.each do |email|
      if User.find_by(:email => email)
        invited_guests_array << User.find_by(:email => email)
      end
    end
    invited_guests_array
  end

  def final_menu?
    (self.menu.present? && self.menu.finalized) ? 'Yes' : 'Not yet'
  end

  def dinner_date
    self.date ? self.date.strftime('%B %d, %Y') : 'No date'
  end
end
