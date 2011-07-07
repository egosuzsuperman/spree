UsersController.class_eval do

  def show
    render :layout => "users"
    @orders = @user.orders.complete
  end

  def create
    @user = User.new(params[:user])
    if @user.save

      if current_order
        current_order.associate_user!(@user)
        session[:guest_token] = nil
      end

      redirect_back_or_default(root_url)
    else
      render 'new'
    end

  end

  def update
    if @user.update_attributes(params[:user])
      if params[:user][:password].present?
        # this logic needed b/c devise wants to log us out after password changes
        user = User.reset_password_by_token(params[:user])
        sign_in(@user, :event => :authentication, :bypass => !Spree::Auth::Config[:signout_after_password_change])
      end
      flash.notice = I18n.t("account_updated")
      redirect_to account_url
    else
      render 'edit'
    end

  end


end
