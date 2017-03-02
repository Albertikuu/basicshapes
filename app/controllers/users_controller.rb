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
	    redirect_to(:back)
  	end



end
