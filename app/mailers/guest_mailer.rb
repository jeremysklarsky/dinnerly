class GuestMailer < ApplicationMailer

  default from: "approvablefeast@gmail.com"

  # invite email when host selects menu
  def invite_guest_to_cook(user_email, recipient, subject, dinner_page, dinner)
    @dinner_page = dinner_page
    @subject = subject
    @dinner = dinner

    @user_email = user_email
    @recipient = recipient
    mail(:to => @recipient,
         :subject => @subject,
         :reply_to => @user_email)
  end  

  # invite email for election menu
  def invite_guest_to_vote(user_email, recipient, subject, dinner_page, dinner)
    @dinner_page = dinner_page
    @subject = subject
    @dinner = dinner

    @user_email = user_email
    @recipient = recipient
    mail(:to => @recipient,
         :subject => @subject,
         :reply_to => @user_email)
  end 

  # email guests when votes have been tallied to pick dish to cook
  def notify_guest_when_tallied(user_email, recipient, subject, dinner_page, dinner)
    @dinner_page = dinner_page
    @subject = subject
    @dinner = dinner

    @user_email = user_email
    @recipient = recipient
    # binding.pry
    mail(:to => @recipient,
         :subject => @subject,
         :reply_to => @user_email)
  end

end
