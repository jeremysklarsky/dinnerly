class Menu < ActiveRecord::Base

  belongs_to :dinner
  delegate :host, to: :dinner
  has_many :menu_recipes
  has_many :recipes, through: :menu_recipes

  def tally_votes
    @menu = self
    @dinner = @menu.dinner
    @options = @menu.menu_recipes.collect{|mr|mr.id}

    @apps = @menu.menu_recipes.where(course_name: "Appetizer")
    @sides = @menu.menu_recipes.where(course_name: "Side")
    @mains = @menu.menu_recipes.where(course_name: "Main")
    @desserts = @menu.menu_recipes.where(course_name: "Dessert")

    @num_apps = @apps.size / 2
    @num_sides = @sides.size / 2
    @num_mains = @mains.size / 2
    @num_desserts = @desserts.size / 2

    @choices = []
    @choices << @apps.sort_by {|a| a.vote_total }.reverse[0..@num_apps-1].collect {|a| a.id}
    @choices << @sides.sort_by {|a| a.vote_total }.reverse[0..@num_sides-1].collect {|a| a.id}
    @choices << @mains.sort_by {|a| a.vote_total }.reverse[0..@num_mains-1].collect {|a| a.id}
    @choices << @desserts.sort_by {|a| a.vote_total }.reverse[0..@num_desserts-1].collect {|a| a.id}
    @choices.flatten!

    (@options - @choices).each do |reject|
      @menu.menu_recipes.find(reject).destroy
    end
    @menu.finalized = true
    @menu.save

  end

  def email_guests_with_final_menu(dinner, host)
    @dinner = dinner
    dinner_page = "http://www.approvablefeast.com/users/#{host.id}/dinners/#{@dinner.id}" 
    subject = "What do you want to bring to #{host.name}'s potluck?"
    @dinner.guest_emails.split(",").each do |recipient|
      GuestMailer.notify_guest_when_tallied(host.email, recipient, subject, dinner_page, @dinner).deliver
    end
    GuestMailer.notify_guest_when_tallied(host.email, host.email, subject, dinner_page, @dinner).deliver
  end


















  def appetizers
    self.menu_recipes.where(course_name: "Appetizer").collect {|mr| mr.recipe}
  end

  def sides
    self.menu_recipes.where(course_name: "Side").collect {|mr| mr.recipe}
  end

  def mains
    self.menu_recipes.where(course_name: "Main").collect {|mr| mr.recipe}
  end

  def desserts
    self.menu_recipes.where(course_name: "Dessert").collect {|mr| mr.recipe}
  end

  def menu_appetizers
    self.menu_recipes.where(course_name: "Appetizer").collect {|mr| mr}
  end

  def menu_sides
    self.menu_recipes.where(course_name: "Side").collect {|mr| mr}
  end

  def menu_mains
    self.menu_recipes.where(course_name: "Main").collect {|mr| mr}
  end

  def menu_desserts
    self.menu_recipes.where(course_name: "Dessert").collect {|mr| mr}
  end
end
