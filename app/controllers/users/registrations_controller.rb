class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    courses_url
  end

  def after_sign_up_path_for(resource)
    courses_url
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:dni, :code, :name, :lastname1, :lastname2, :branch_id, :district, :age, :facebook_username,
      :email, :phone1, :phone2, :password)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:dni, :code, :name, :lastname1, :lastname2, :branch_id, :district, :age, :facebook_username,
        :email, :phone1, :phone2, :password, :current_password)
    end
  end

end
