class ApplicationController < ActionController::Base






  protect_from_forgery with: :exception

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?



  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update){ |u| 
      u.permit(:password, :password_confirmation, :current_password) 
    }
  end

end

  #helper_method :current_user


  #def current_user
  #	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end


  #def require_user
 # 	redirect_to	'/login' unless current_user	
  #end


