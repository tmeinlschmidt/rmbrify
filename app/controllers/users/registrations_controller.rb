class Users::RegistrationsController < Devise::RegistrationsController
	#before_filter :configure_sign_up_params, only: [:create]
	#before_filter :configure_account_update_params, only: [:update]
	
	# GET /resource/sign_up
	#def new
	#  super
	#end

	# POST /resource
	def create
		#spustit originalni funkci, neprepsat
		#super

		build_resource(sign_up_params)
    resource.save

    if resource.persisted?
    	#v poho
    	if resource.active_for_authentication?
    		#aktivni model, v authenticable.rb to stejnak vraci true, tak to radsi necham tady, hehe
    		
    		#vypisovani nejaky zpravy - zbytecny
    		#set_flash_message :notice, :signed_up if is_navigational_format?
        
    		#prihlasit
        sign_in resource_name, resource
        
        #jedina moznost, jak presmerovat na ajax pozadavku
        #render js: "window.location='#{root_path(resource)}'"
        
        #vratit 'nic', kazdopadne hlavicka je 200 -> OK, neni nutny posilat zadnej json a podobny blbiny
        render nothing: true
    	else
    		#nemam poneti na co to je
    		set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive_message.to_s if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
    	end
    else
    	#chyba

    	#nechapu, co je tohle - resource.errors
    	render json: resource.errors.full_messages, status: 401
    end
	end

	# GET /resource/edit
	# def edit
	#   super
	# end

	# PUT /resource
	# def update
	#   super
	# end

	# DELETE /resource
	# def destroy
	#   super
	# end

	# GET /resource/cancel
	# Forces the session data which is usually expired after sign
	# in to be expired now. This is useful if the user wants to
	# cancel oauth signing in/up in the middle of the process,
	# removing all OAuth session data.
	# def cancel
	#   super
	# end

	# protected

	# You can put the params you want to permit in the empty array.
	# def configure_sign_up_params
	#   devise_parameter_sanitizer.for(:sign_up) << :attribute
	# end

	# You can put the params you want to permit in the empty array.
	# def configure_account_update_params
	#   devise_parameter_sanitizer.for(:account_update) << :attribute
	# end

	# The path used after sign up.
	#def after_sign_up_path_for(resource)
		#super(resource)

		#jedina moznost, jak presmerovat na ajax pozadavku
		#render js: "window.location='#{root_path(resource)}'"

		#render nothing: true
	#end

	# The path used after sign up for inactive accounts.
	#def after_inactive_sign_up_path_for(resource)
	#  super(resource)
	#end
end
