class Users::SessionsController < Devise::SessionsController
# skip_before_action :load_categories, only: [:new, :create] #avoids conflict with login process

  def new
    super
  end

  def create
    super
    session[:categories] = current_user.categories
    session[:teams] = current_user.categories
  end

end 