module Find_teams

	def find_teams
		if user_signed_in? && current_user.teams.size == 0
			redirect_to '/teams/find'
		end
	end	

end