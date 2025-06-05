module Api
  module Seguridad
    class SeguridadController < ApplicationController
      def login
        user = Negocio.get_usuario(params[:usuario], params[:password])
        if user.nil?
          render json: { Id_Resultado: 0, Respuesta: "Datos de acceso incorrectos" }, status: :unauthorized
          return
        end

        payload = {
          sub: params[:usuario],
          idUsuario: user[:IdUsuario],
          idRol: user[:Rol]
        }

        token = UtilsClass.create_access_token(payload)

        render json: { access_token: token, token_type: "bearer" }, status: :ok
      end
    end
  end
end
