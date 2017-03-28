module Find_teams

	def find_teams

		if user_signed_in? && current_user.teams.size == 0
			redirect_to '/teams/find'
		elsif user_signed_in? && current_user.teams.size != 0
			unless session[:current_team] 
				session[:current_team] = current_user.teams.first
			end
		end
			
	end	

end