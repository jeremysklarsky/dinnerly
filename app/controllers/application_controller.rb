class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  
  private
    def login(user)
      session[:user_id] = user.id 
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user
    
    def logged_in?
      !!current_user
    end

    helper_method :logged_in?

    def login_required
      if !logged_in?
        flash[:notice] = "You must be logged in!"
        redirect_to root_path
      end
    end

    # def resetting?
    #   session[:reset_path] = request.path
    #   if !logged_in?
    #     flash[:notice] = "You must be logged in!"
    #     redirect_to login_path
    #   else
    #     redirect_to session[:reset_path]
    #   end
    # end

    def invited?
      session[:dinner_path] = request.path
      dinner_id = session[:dinner_path].split("/").last
      dinner = Dinner.find(dinner_id)
      email_list = dinner.guest_emails.split(",")
      if !logged_in?
        flash[:notice] = "You must be logged in!"
        redirect_to login_path
      else 
        if dinner.host != current_user
          if !email_list.include?(current_user.email)
            flash[:notice] = "You're not invited!"
            redirect_to user_path(current_user)
          elsif !dinner.guests.include?(current_user)
            redirect_to "#{session[:dinner_path]}/rsvp"
          else
            # redirect_to "#{session[:dinner_path]}/rsvp"
          end
        end 
      end
    end
end