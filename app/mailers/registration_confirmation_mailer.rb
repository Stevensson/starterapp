class RegistrationConfirmationMailer < ActionMailer::Base
  default from: "me@examplemail.com"

  def confirm(user)
	@user = user
	mail(to: @user.email, :subject => "Thanks for signing up!")
  end

end
