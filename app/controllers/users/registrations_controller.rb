class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def after_sign_up_path_for(resource)
    user = User.find_by(name: resource[:name])
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(user)
  end


  def after_update_path_for(resource)
    user = User.find_by(configure_account_update_params)
    flash[:notice] = "successfully."
    user_path(user)
  end

  protected
    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
    end
end
