class FramesController < ApplicationController
before_action :find_teams
include Find_teams

	def index	

		if session[:current_team]
			@commits = Team.find_by(id: session[:current_team]['id']).commits.reverse
		end

	end


end
