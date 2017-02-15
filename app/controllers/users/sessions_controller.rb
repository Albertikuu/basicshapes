class Users::SessionsController < Devise::SessionsController
skip_before_action :load_categories, only: [:new, :create]

  def new
    super
  end

  def create
    super
  end

end 