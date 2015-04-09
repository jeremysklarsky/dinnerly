class GuestMailer < ApplicationMailer

  default from: "approvablefeast@gmail.com"

  def invite_guests(user_email, recipients, subject, dinner_page)
    @dinner_page = dinner_page
    @subject = subject

    @user_email = user_email
    @recipients = recipients

    @recipients.each do |recipient|
      mail(:to => recipient,
            :subject => @subject,
            :reply_to => @user_email)
    end
  end  

end
