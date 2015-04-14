class GuestMailer < ApplicationMailer

  default from: "approvablefeast@gmail.com"

  def invite_guests(user_email, recipient, subject, dinner_page, dinner)
    @dinner_page = dinner_page
    @subject = subject
    @dinner = dinner

    @user_email = user_email
    @recipient = recipient
    mail(:to => @recipient,
            :subject => @subject,
            :reply_to => @user_email)
  end  

end
