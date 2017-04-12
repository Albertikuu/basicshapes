class TeamsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	skip_before_action :verify_authenticity_token, only: [:create, :remove_member, :invite_users]
	before_action :select_team, except: [:create, :new, :added_to_team]


	def index
		@teams = Team.all
		render json: @teams
	end

	def show
		binding.pry
		if @team == nil
			not_found
		end

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
		@team = Team.new(team_params)
		if @team.valid?
			session[:current_team] = @team
			session[:categories] = []
			if params[:members][0] != ""
				params[:members].each do |email_address|
					invite_email(email_address)
				end
			end
			@team.slug = @team.name.gsub(' ','-')
			@team.users << current_user
			@team.save
			redirect_to('/')
		else
			flash[:alert] = @team.errors.messages[:name][0]
			@team.delete
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
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
		redirect_back(fallback_location: root_path)
	end

	def invite_users
		if params[:members][0] != ""
			params[:members].each do |email_address|
				invite_email(email_address)
			end
		end
		flash[:notice] = "Invitations sent"
		redirect_back(fallback_location: root_path)
	end

	def find
		@teams = Team.all
	end

	def update
	    @team.update_attribute(:logo, params[:team][:logo])
	    redirect_back(fallback_location: root_path)
  	end

  	def added_to_team
  		@token = params[:invite_token]
        team_slug =  Invitation.find_by_token(@token).team_slug 
        team = Team.find_by(slug: team_slug)
        team.users << Invitation.find_by_token(@token).recipient
        session[:current_team] = team
  		redirect_to root_path
  	end


	private

	def team_params
		params.permit(:name, :logo)
	end

	def select_team
		@team = Team.find_by(slug: params[:team_slug])
	end

	def invite_email(email_address)
		@invite = Invitation.new(:email => email_address)
	    @invite.sender_id = current_user.id
	    @invite.team_slug = @team.slug
	    message = params[:message]
	    if @invite.save
			if User.exists?(email: email_address)
			   		member = User.find_by(email: email_address)
			   		@invite.recipient_id = member.id
			   		@invite.save
		     		TeamMailer.invite_user_email(@team, message, current_user, member, added_to_team_path(:invite_token => @invite.token)).deliver_now
			    else    
			     	TeamMailer.invite_email(@team, message, current_user, email_address, new_user_registration_path(:invite_token => @invite.token)).deliver_now
			end
		end
	end

end
