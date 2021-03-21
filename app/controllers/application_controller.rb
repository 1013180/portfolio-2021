class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  before_action :set_search

  def set_search
    @search = Shoe.ransack(params[:q]) # ransackの検索メソッド
  end
end
