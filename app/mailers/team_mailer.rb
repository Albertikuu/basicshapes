class TeamMailer < ApplicationMailer
	default from: "teams@basicshap.es"

	def invite_email(user, team)
		@user = user
		mail(to @user.email, subject: "#{@user.first_name.capitalize}, you have been invited to a Basicshapes team!")
	end
end
