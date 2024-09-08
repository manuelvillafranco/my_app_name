class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to protected_path, notice: 'Has iniciado sesión correctamente.'
    else
      flash.now[:alert] = 'Nombre de usuario o contraseña incorrectos'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Has cerrado sesión.'
  end
end
