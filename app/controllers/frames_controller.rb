class FramesController < ApplicationController
before_action :find_teams, except: :thanks
include Find_teams

	def index	
		if session[:current_team]
			@commits = Team.find_by(id: session[:current_team]['id']).commits.reverse
		end
	end

	def thanks
		@name = session[:name]
	end


end
