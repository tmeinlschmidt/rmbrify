class HomeController < ApplicationController
	layout 'home'
	
	def tour
		#index page for non logged-in users with tour and login form
	end

	def register
		#single registration page
		if user_signed_in?
			redirect_to tour_path
		end
	end

	def forgot
		#single password recovery page
		if user_signed_in?
			redirect_to root_path
		end
	end
end
