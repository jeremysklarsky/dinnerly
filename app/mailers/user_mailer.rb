class UserMailer < ApplicationMailer

  default from: "approvablefeast@gmail.com"

  def create_and_deliver_password_change(user, random_password)
    @user = user
    @user_name = user.name
    @recipient = user.email
    @random_password = random_password
    mail(:to => @recipient,
         :subject => "Password Reset at Approvable Feast",
         :reply_to => "approvablefeast@gmail.com")
  end
end
