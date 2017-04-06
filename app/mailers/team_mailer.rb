class TeamMailer < ApplicationMailer
	default from: "teams@basicshap.es"

	def invite_user_email(team, message, sender, recipient, url)
		binding.pry
		@recipient = recipient
		if message
			@message = "<hr/><p>#{sender.full_name} says:</p><p><em>#{message}</em></p>"
		end
		@team = team
		@url = url
		@sender = sender
		mail(to: @recipient.email, subject: "#{@recipient.first_name.capitalize}, you have been invited to a Basicshapes team")
	end

	def invite_email (team, message, sender, email, url)
		@team = team
		if message
			@message = "<hr/><p>#{sender.full_name} says:</p><p><em>#{message}</em></p>"
		end		
		@sender = sender
		@email = email
		@url = url
		mail(to: @email, subject: "You have been invited to join Basichapes!")
	end

end
