class TeamsController < ApplicationController
before_action :authenticate_user!
skip_before_action :verify_authenticity_token, only: [:create, :remove_member]

	def index
		@teams = Team.all
		render json: @teams
	end

	def show 

		@team = Team.find_by(name: params[:team_name])
	
		unless @team.users.include?(current_user)
			flash[:alert] = "You are not part of this group"
			redirect_to('/')
		end
	end

	def change_session
		new_team = Team.find_by(name: params[:team_name])
		session[:current_team] = new_team
	    session[:categories] = current_user.categories.where(team_id: new_team.id)
 		redirect_to('/')
	end

	def new

	end

	def create
		@team = current_user.teams.create!(team_params)
		
		params[:members].each do |email|
			member = User.find_by(email: email)
			@team.users << member
		end

		redirect_to('/')
	end

	def destroy
		@team = Team.find_by(name: params[:name]).delete
	    session[:current_team] = current_user.teams.first
		redirect_to('/')
	end


	def remove_member
		@team = Team.find_by(name: params[:team_name])
		if @team.participations.size <= 1
			flash[:error] = "The team needs at least one participant"
		else
		participation = @team.participations.where(user_id: params[:user_id])
		Participation.delete(participation[0].id)
		end
		redirect_to(:back)
	end


	private

	def team_params
		params.permit(:name)
	end


end
