class UserMailer < ApplicationMailer
  def change_password(user)
    @user = user
    email = @user.email
    email = ENV["email_address"]
    mail(
      to: email,
      subject: 'Change Password'
    )
  end
end
