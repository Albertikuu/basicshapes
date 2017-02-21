class TeamsController < ApplicationController
before_action :authenticate_user!

	def index
		binding.pry
		# @teams = Team.find_by
	end

	def show 
		@team = Team.find_by(name: params[:team_name])
		# binding.pry
		unless @team.users.include?(current_user)
			redirect_to('/')
		end
	end

	def change_session
		new_team = Team.find_by(name: params[:team_name])
		session[:current_team] = new_team
	    session[:categories] = current_user.categories.where(team_id: new_team.id)
 		redirect_to('/')
	end


end
