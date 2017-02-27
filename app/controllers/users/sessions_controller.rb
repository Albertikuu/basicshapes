class Users::SessionsController < Devise::SessionsController
# skip_before_action :load_categories, only: [:new, :create] #avoids conflict with login process

  def new
    super
  end

  def create

    super

    unless session[:current_team]
      if current_user.teams.size == 0
      session[:categories] = []
      else
	    session[:categories] = current_user.categories.where(team_id: current_user.teams.first.id)
	    session[:current_team] = current_user.teams.first
      end
	  end

  end

end 
