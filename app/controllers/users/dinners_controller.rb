class Users::DinnersController < ApplicationController

  before_filter :invited?, only: [:show]

  def new
    @dinner = Dinner.new
  end

  def create
    @user = User.find(params[:user_id])
    @dinner = Dinner.new(dinner_params)
    @dinner.host = @user
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
    dinner_page = "http://www.approvablefeast.com/users/#{current_user.id}/dinners/#{params[:id]}"
    user_email = current_user.email
    @user = current_user
    subject = "#{@user.name}'s invited you to a dinner party!"
    dinner = Dinner.find(params[:id])
    
    recipients = EmailSanitizer.clean_emails(params["guest"]["emails"], dinner)
    recipients.each do |recipient|
      if dinner.menu.election
        header = "You're invited to vote!"
        link_action = "Vote now!"
        GuestMailer.email_guests(user_email, recipient, subject, dinner_page, dinner, header, link_action).deliver  
      else
        header = "You're invited to cook!"
        link_action = "RSVP"
        GuestMailer.email_guests(user_email, recipient, subject, dinner_page, dinner, header, link_action).deliver
      end
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
      @dinner.guest_emails = @dinner.guest_emails.gsub(/#{current_user.email}/,"")
      @dinner.save
      redirect_to root_path
    end
  end

  private

  def dinner_params
    params.require(:dinner).permit(:name, :location, :date, :time)
  end

end
