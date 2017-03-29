class TeamMailer < ApplicationMailer
	default from: "teams@basicshap.es"

	def invite_user_email(team, sender, recipient, url)
		@recipient = recipient
		@team = team
		@url = url
		@sender = sender
		mail(to: @recipient.email, subject: "#{@recipient.first_name.capitalize}, you have been invited to a Basicshapes team")
	end

	def invite_email (team, sender, email, url)
		@team = team
		@sender = sender
		@email = email
		@url = url
		mail(to: @email, subject: "You have been invited to join Basichapes!")
	end

end
