class TeamMailer < ApplicationMailer
	default from: "teams@basicshap.es"

	def invite_user_email(user, team, sender)
		@user = user
		@team = team
		mail(to: @user.email, subject: "#{@user.first_name.capitalize}, you have been invited to a Basicshapes team")
	end

	def invite_email (email, team, sender)
		@email = email
		@team = team
		mail(to: @email, subject: "You have been invited to join Basichapes!")
	end

end
