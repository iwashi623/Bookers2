class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  def after_sign_in_path_for(resource)
    user = User.find_by(name: resource[:name])
    flash[:notice] = "Signed up successfully."
    user_path(user)
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed out successfully."
    root_path
  end

  protected
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end
end
