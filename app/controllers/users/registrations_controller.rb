class Users::RegistrationsController < Devise::RegistrationsController
 
  def new
    @token = params[:invite_token]
    super
  end

  def create
    @token = params[:invite_token]
    if @token != nil
    @newUser = build_resource(sign_up_params)
    @newUser.save
    @token = params[:invite_token]
       team_slug =  Invitation.find_by_token(@token).team_slug 
        binding.pry
       team = Team.find_by(slug: team_slug)
        binding.pry
       team.users << @newUser 
       redirect_to root_path
    else
      super
    end
    session[:categories] = []
  end


  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :job_title, :location, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :job_title, :location, :avatar)
  end
  
end 