class AdminSessionController < Devise::SessionsController
	before_action :authenticate_admin!
	
	def index
	end
end
