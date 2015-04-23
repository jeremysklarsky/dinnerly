class Menu < ActiveRecord::Base
  belongs_to :dinner
  delegate :host, to: :dinner
  has_many :menu_recipes, dependent: :destroy
  has_many :recipes, through: :menu_recipes

  def tally_votes
    @dinner = self.dinner
    @options = self.menu_recipes.collect { |mr| mr.id }

    @num_apps = menu_appetizers.size / 2
    @num_sides = menu_sides.size / 2
    @num_mains = menu_mains.size / 2
    @num_desserts = menu_desserts.size / 2

    @choices = []
    @choices << menu_appetizers.sort_by {|a| a.vote_total }.reverse[0..@num_apps-1].collect {|a| a.id}
    @choices << menu_sides.sort_by {|a| a.vote_total }.reverse[0..@num_sides-1].collect {|a| a.id}
    @choices << menu_mains.sort_by {|a| a.vote_total }.reverse[0..@num_mains-1].collect {|a| a.id}
    @choices << menu_desserts.sort_by {|a| a.vote_total }.reverse[0..@num_desserts-1].collect {|a| a.id}
    @choices.flatten!

    (@options - @choices).each do |reject|
      self.menu_recipes.find(reject).destroy
    end
    self.finalized = true
    self.save
  end

  def email_guests_with_final_menu(dinner, host)
    @dinner = dinner
    dinner_page = "http://www.approvablefeast.com/users/#{host.id}/dinners/#{@dinner.id}" 
    subject = "What do you want to bring to #{host.name}'s potluck?"
    header = "You're invited to cook!"
    link_action = 'Sign Up!'

    @dinner.guest_emails << host.email
    @dinner.guest_emails.split(',').each do |recipient|
      if recipient.length > 1
        GuestMailer.email_guests(host.email, recipient, subject, dinner_page, @dinner, header, link_action).deliver
      end
    end
  end

  def appetizers
    self.menu_recipes.where(course_name: 'Appetizer').collect(&:recipe)
  end

  def sides
    self.menu_recipes.where(course_name: 'Side').collect(&:recipe)
  end

  def mains
    self.menu_recipes.where(course_name: 'Main').collect(&:recipe)
  end

  def desserts
    self.menu_recipes.where(course_name: 'Dessert').collect(&:recipe)
  end

  def menu_appetizers
    self.menu_recipes.where(course_name: 'Appetizer').collect {|mr| mr}
  end

  def menu_sides
    self.menu_recipes.where(course_name: 'Side').collect {|mr| mr}
  end

  def menu_mains
    self.menu_recipes.where(course_name: 'Main').collect {|mr| mr}
  end

  def menu_desserts
    self.menu_recipes.where(course_name: 'Dessert').collect {|mr| mr}
  end
end
