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


end
