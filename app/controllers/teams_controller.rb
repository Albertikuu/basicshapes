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
		session[:current_team] = Team.find_by(name: params[:team_name])
        session[:categories] = Team.find_by(name: params[:team_name]).categories
 		redirect_to(:back)
	end


end
