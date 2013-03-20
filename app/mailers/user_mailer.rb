class UserMailer < ActionMailer::Base
  default from: "cspp52553@gmail.com"

  def registration_confirmation(user)
  	@user = user
  	mail(:to => user.email , :subject => "Registered")
  end

end
