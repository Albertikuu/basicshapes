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
      team_slug =  Invitation.find_by(token: @token).team_slug 
      team = Team.find_by(slug: team_slug)
      team.users << @newUser 
      redirect_to root_path
    else
      build_resource(sign_up_params)
      resource.save
        yield resource if block_given?
        if resource.persisted?
          if resource.active_for_authentication?
            set_flash_message! :notice, :signed_up
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
            expire_data_after_sign_in!
            after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
    end
    session[:categories] = []
  end

  def after_inactive_sign_up_path_for(resource)
      session[:name] = resource.first_name
      redirect_to thanks_url
  end


  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :job_title, :location, :avatar)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :job_title, :location, :avatar)
  end
  
end 