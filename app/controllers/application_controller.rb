class ApplicationController < ActionController::Base
# before_action :load_categories 
protect_from_forgery with: :null_session
before_action :find_teams, except: [:destroy, :create]

  private

	def find_teams
		if user_signed_in? && current_user.teams.size == 0
			redirect_to '/teams/find'
		end
	end


end
