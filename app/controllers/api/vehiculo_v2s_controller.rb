module Api
  class VehiculoV2sController < ApplicationController
    before_action :set_vehiculo, only: [:show, :update, :destroy]

    def index
      @vehiculos = VehiculoV2.all
      render json: @vehiculos
    end

    def show
      render json: @vehiculo
    end

    def create
      @vehiculo = VehiculoV2.new(vehiculo_params)
      if @vehiculo.save
        render json: @vehiculo, status: :created
      else
        render json: @vehiculo.errors, status: :unprocessable_entity
      end
    end

    def update
      if @vehiculo.update(vehiculo_params)
        render json: @vehiculo
      else
        render json: @vehiculo.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @vehiculo.destroy
      head :no_content
    end

    private

    def set_vehiculo
      @vehiculo = VehiculoV2.find(params[:id])
    end

    def vehiculo_params
      params.require(:vehiculo_v2).permit(
        :marca, :modelo, :color, :no_serie, :placa, :tipo, :motor, :kms,
        :espejo_retrovisor, :espejo_izquierdo, :espejo_derecho, :antena,
        :tapones_ruedas, :radio, :encendedor, :gato, :herramienta,
        :llanta_refaccion, :limpiadores, :pintura_rayada, :cristales_rotos,
        :golpes, :tapetes, :extintor, :tapones_gasolina, :calaveras_rotas,
        :molduras_completas, :id_cliente, :id_empleado, :foto,
        :espejo_retrovisor_foto, :espejo_izquierdo_foto, :antena_foto,
        :tapones_ruedas_foto, :radio_foto, :encendedor_foto, :gato_foto,
        :herramienta_foto, :llanta_refaccion_foto, :limpiadores_foto,
        :pintura_rayada_foto, :cristales_rotos_foto, :golpes_foto,
        :tapetes_foto, :extintor_foto, :tapones_gasolina_foto,
        :calaveras_rotas_foto, :molduras_completas_foto
      )
    end
  end
end
