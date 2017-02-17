class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    super
    session[:categories] = []
  end


  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :job_title, :location)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :job_title, :location)
  end
  
#http://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html

end 