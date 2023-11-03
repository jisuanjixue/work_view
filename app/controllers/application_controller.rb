class ApplicationController < ActionController::Base
    around_action :set_turbo_session_id
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_turbo_session_id(&block)
    Current.set(turbo_session_id: request.headers["X-Turbo-Session-ID"], &block)
  end

    # def after_sign_in_path_for(_resource)
    #   posts_path
    # end
end
