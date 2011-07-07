UserSessionsController.class_eval do


def new
	render :layout => 'user_sessions'
end
def create
    authenticate_user!

    if user_signed_in?
      respond_to do |format|
        format.html {
          flash[:notice] = I18n.t("logged_in_succesfully")
          redirect_to "/mindfunction/home/"
        }
        format.js {
          user = resource.record
          render :json => {:ship_address => user.ship_address, :bill_address => user.bill_address}.to_json
        
	}
      end
    else
      flash[:error] = I18n.t("devise.failure.invalid")
      render :new
    end
  end

  def destroy
  	session.clear
  	redirect_to "/mindfunction/home/"
  end
end

