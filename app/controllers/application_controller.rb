class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_admin!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to users_path, :notice => exception.message
  end


  def current_ability
    @current_ability ||= ::Ability.new(current_admin)
  end

end
