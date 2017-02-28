class TeamsController < ApplicationController
before_action :authenticate_user!
skip_before_action :verify_authenticity_token, only: [:create, :remove_member]
before_action :select_team, except: [:create, :new]


	def index
		@teams = Team.all
		render json: @teams
	end

	def show
		unless @team.users.include?(current_user)
			flash[:alert] = "You are not part of this group"
			redirect_to('/')
		end
	end

	def change_session
		session[:current_team] = @team
	    session[:categories] = current_user.categories.where(team_id: @team.id)
 		redirect_to('/')
	end

	def new
		@team = Team.new
	end

	def create
		@team = current_user.teams.create!(team_params)
		session[:current_team] = @team
		session[:categories] = []
		params[:members].each do |email|
			member = User.find_by(email: email)
			@team.users << member
		end
		@team.slug = @team.name.gsub(' ','-')
		@team.save
		redirect_to('/')
	end

	def destroy
		binding.pry
		@team.delete
	    session[:current_team] = current_user.teams.first
		redirect_to('/')
	end


	def remove_member
		if @team.participations.size <= 1
			flash[:error] = "The team needs at least one participant"
		else
			participation = @team.participations.where(user_id: params[:user_id])
			Participation.delete(participation[0].id)
		end
		redirect_to(:back)
	end

	def find
		@teams = Team.all
	end


	private

	def team_params
		params.permit(:name, :logo)
	end

	def select_team
		@team = Team.find_by(slug: params[:team_slug])
	end


end
