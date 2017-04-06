class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]


	def show
		@users = User.all
		@user = User.find(params[:id])
		@other_categories = Category.all - @user.categories
	end

	def update
	    user = current_user
	    user.update_attribute(:avatar, params[:user][:avatar])
	    redirect_back(fallback_location: root_path)
  	end

  	def resend_confirmation
  		user = User.find_by(id: params[:user_id])
		user.send_confirmation_instructions	
  	end


end
