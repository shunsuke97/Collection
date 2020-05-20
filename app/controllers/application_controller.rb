class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # deviseのコントローラから呼び出された場合は「configure_permitted_parameters」メソッドが呼び出される。protected以下で定義。
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
