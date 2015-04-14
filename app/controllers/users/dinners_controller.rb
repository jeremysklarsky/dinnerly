class Users::DinnersController < ApplicationController

  before_filter :invited?, only: [:show]

  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new(name: params[:dinner][:name], location: params[:dinner][:location], datetime: params[:dinner][:datetime], host_id: params[:user_id]) 
    @dinner.guest_emails = ""
    if @dinner.save
      redirect_to "/users/#{current_user.id}/dinners/#{@dinner.id}"
    else
      flash.now[:notice] = "That didn't work!"
      render :new
    end

  end

  def show
    @menu = Menu.new
    @cuisines = Cuisine::CUISINES.keys.sort
    @dinner = Dinner.find(params[:id])
  end

  def invite
    
    dinner_page = "http://localhost:3000/users/#{current_user.id}/dinners/#{params[:id]}"
    user_email = current_user.email
    @user = current_user
    subject = "#{@user.name}'s invited you to a dinner party!"
    dinner = Dinner.find(params[:id])
    binding.pry
    emails = params["guest"]["emails"].select{|email| email.length > 1}
    emails.each do |email|
      dinner.guest_emails << "," + email.strip
    end    
    dinner.save
    recipients = emails.collect do |email|
      email.strip
    end
    binding.pry
    recipients.each do |recipient|
      GuestMailer.invite_guests(user_email, recipient, subject, dinner_page, dinner).deliver
    end
    respond_to do |f|
      f.js 
    end
  end

  def rsvp
    @dinner = Dinner.find(params[:id])
  end

  def update
    @dinner = Dinner.find(params[:id])
    if params[:dinner][:guests] == "Yes"
      @dinner.guests << current_user
      @dinner.save
      redirect_to user_dinner_path(@dinner.host, @dinner)
    else
      redirect_to root_path
    end

  end

end
