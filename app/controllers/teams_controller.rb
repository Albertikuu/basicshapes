class TeamsController < ApplicationController

	def index
		binding.pry
		# @teams = Team.find_by
	end

	def show 
		@team = Team.find_by(title: params[:title])
	end


end
