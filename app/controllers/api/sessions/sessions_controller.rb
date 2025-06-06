require 'jwt'
class Api::Sessions::SessionsController < ApplicationController
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def create
    usuario = Usuario.find_by(usuario: params[:usuario])

    if usuario&.authenticate(params[:contrasena])
      payload = { usuario: usuario.usuario, idUsuario: usuario.id }
      token = JWT.encode(payload, SECRET_KEY)

      render json: { access_token: token, token_type: 'bearer' }, status: :ok
    else
      render json: { error: 'Datos de acceso incorrectos' }, status: :unauthorized
    end
  end
end
