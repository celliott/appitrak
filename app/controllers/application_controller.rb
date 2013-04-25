class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_timezone 

  def show_menu
    @show_menu = true
    @user = User.find(current_user_id)
  end
  
  def show_public_menu
    @show_public_menu = true
  end
  
  def current_user_id
    if cookies[:user_id]
      @current_user_id = cookies.signed[:user_id]
      current_user_id = cookies.signed[:user_id]
    else
      @current_user_id = session[:user_id]
      current_user_id = session[:user_id]
    end
  end
  
  protected
  
  def confirm_logged_in
    session[:user_id] = cookies.signed[:user_id] if cookies[:user_id]
    unless session[:user_id] || cookies[:user_id]
      flash[:error] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end
  
  private

	def set_timezone
    Time.zone = cookies["time_zone"]
  end

end
