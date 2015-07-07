class ApplicationController < ActionController::Base
	#layout :none
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  #protect_from_forgery

  before_action :set_locale
 
  def set_locale
    #I18n.locale = params[:locale] || I18n.default_locale
  	I18n.locale = 'en'
  end
end
