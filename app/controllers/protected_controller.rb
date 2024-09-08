class ProtectedController < ApplicationController
  before_action :require_login

  def show
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to login_path, alert: 'Debes iniciar sesión para acceder a esta página.'
    end
  end
end
