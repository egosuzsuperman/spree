UserRegistrationsController.class_eval do

def new
	render :layout => "user_registrations"
	@user=User.new
end

def create
	@user = build_resource(params[:user])
	logger.debug(@user)
	if resource.save
		set_flash_message(:notice, :signed_up)
		sign_in_and_redirect(:home, @user)
	else
		clean_up_passwords(resource)
		render_with_scope(:new)
	end
end
end
