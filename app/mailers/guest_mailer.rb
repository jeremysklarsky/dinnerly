class GuestMailer < ApplicationMailer
  default from: "approvablefeast@gmail.com"

  def email_guests(user_email, recipient, subject, dinner_page, dinner, header, link_action)
    @dinner_page = dinner_page
    @subject = subject
    @dinner = dinner
    @header = header
    @link_action = link_action

    @user_email = user_email
    @recipient = recipient
    mail(:to => @recipient,
         :subject => @subject,
         :reply_to => @user_email)
  end


end
