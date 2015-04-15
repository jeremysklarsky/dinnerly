class MenusController < ApplicationController

  def create
    @dinner = Dinner.find(params[:dinner_id])
    @dinner.menu = MenuGenerator.new(params['menu']).call
    
    @dinner.menu.election = true if params[:menu][:election] == "Let your guests vote"
    @dinner.menu.save
    if @dinner.save
      respond_to do |format|
        format.js
        format.html
      end
    else
      render 'dinners/show'
    end
  end

  def update    
    @menu = Menu.find(params[:id])
    @dinner = @menu.dinner
    @options = @menu.recipes.collect{|r|r.id}
    @choices = params["menu"]["recipes"].map(&:to_i)

    (@options - @choices).each do |reject|
      @menu.menu_recipes.find_by(recipe_id: reject).destroy
    end
    @menu.finalized = true
    @menu.save
    respond_to do |f|
      f.js
    end
  end

  def tally
    @menu = Menu.find(params[:id])
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

    dinner_page = "http://localhost:3000/users/#{current_user.id}/dinners/#{@dinner.id}" 
    subject = "What do you want to bring to #{current_user.name}'s potluck?"
    
    @dinner.guest_emails.split(",").each do |recipient|
      GuestMailer.notify_guest_when_tallied(current_user.email, recipient, subject, dinner_page, @dinner).deliver
    end

    respond_to do |f|
      f.js
    end
  end
end