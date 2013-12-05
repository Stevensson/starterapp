class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  protect_from_forgery with: :exception
before_filter :configure_permitted_parameters, if: :devise_controller?


rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

def after_sign_in_path_for(resource)
  logged_in_home_path
end

def after_sign_out_path_for(resource_or_scope)
  logged_out_message_path
end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email, :password, :remember_me) }
  end
  
end
