class ApplicationController < ActionController::Base
before_action :load_categories 
# before_action :authenticate_user!
protect_from_forgery with: :null_session


  private

	# def load_categories
	# 	if user_signed_in?
	# 		@categories = current_user.categories
	# 	else
	# 		@categories = []
	# 	end	

	# end

	def load_categories

		current_user ? @categories = current_user.categories : @categories = []
		
	end



end
