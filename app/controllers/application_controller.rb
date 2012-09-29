class ApplicationController < ActionController::Base
  	protect_from_forgery

	def authenticate_with_basic_auth
	  authenticate_or_request_with_http_basic do |username, password|
	    @current_admin = Admin.authenticated?(username, password)
	  end
	end

	helper_method :current_admin
	 
	def current_admin
	@current_admin
	end

	before_filter :authenticate_with_basic_auth
  	skip_before_filter :authenticate_with_basic_auth, :only => [:new,:create]
  	skip_before_filter :authenticate_with_basic_auth, :except => [:index,:show,:edit, :destroy] 
end



