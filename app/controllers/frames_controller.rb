class FramesController < ApplicationController
before_action :find_teams, except: :thanks
include Find_teams

	def index	
		if session[:current_team]
			@commits = Team.find_by(id: session[:current_team]['id']).commits.reverse
		end
	end

	def thanks
		@user = User.find_by(id: session[:user_id])
	end


end
