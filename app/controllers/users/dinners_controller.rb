class Users::DinnersController < ApplicationController

  before_filter :invited?, only: [:show]


  def new
    @dinner = Dinner.new
  end

  def create
    @dinner = Dinner.new(name: params[:dinner][:name], location: params[:dinner][:location], datetime: params[:dinner][:datetime], host_id: params[:user_id]) 
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
    subject = "You've got potluck"
    recipients = params[:guest][:emails]
    @dinner = Dinner.find(params[:id])
    binding.pry
    @dinner.guest_emails << params[:guest][:emails].join(",").gsub(" ", "")
    binding.pry
    # if @dinner.guest_emails 
    #   @dinner.guest_emails << ", " + params[:guest][:emails].join(", ").gsub(" ", "")
    # else
    #   @dinner.guest_emails = params[:guest][:emails].join(", ").gsub(" ", "")
    # end
    
    @dinner.save
    GuestMailer.invite_guests(user_email, recipients, subject, dinner_page).deliver

    respond_to do |f|
      f.js 
    end

  end

  def rsvp
  end

end
