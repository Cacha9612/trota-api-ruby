class Api::Vehiculos::VehiculosController < ApplicationController
  def index
    @vehiculos = VehiculoService.listar_vehiculos
    render json: @vehiculos
  end

  def show
    @vehiculo = VehiculoService.obtener_vehiculo(params[:id])
    render json: @vehiculo
  end

  def create
    @vehiculo = VehiculoService.crear_vehiculo(vehiculo_params)
    if @vehiculo.persisted?
      render json: @vehiculo, status: :created
    else
      render json: @vehiculo.errors, status: :unprocessable_entity
    end
  end

  def update
    @vehiculo = VehiculoService.actualizar_vehiculo(params[:id], vehiculo_params)
    if @vehiculo.errors.empty?
      render json: @vehiculo
    else
      render json: @vehiculo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    VehiculoService.eliminar_vehiculo(params[:id])
    head :no_content
  end

  private

  def vehiculo_params
    params.require(:vehiculo).permit(
      :Id_Empleado, :Marca, :Modelo, :Color, :No_serie, :Placa, :Tipo, :Motor, :Kms,
      :MotorVehiculo, :Acumulador, :Espejo_retrovisor, :Espejo_izquierdo, :Espejo_derecho,
      :Antena, :Tapones_ruedas, :Radio, :Encendedor, :Gato, :Herramienta, :Llanta_refaccion,
      :Limpiadores, :Pintura_rayada, :Cristales_rotos, :Golpes, :Tapetes, :Extintor,
      :Tapones_gasolina, :Calaveras_rotas, :Molduras_completas, :Panel_instrumentos,
      :Lado_izquierdo, :Lado_izquierdo_inf, :Lado_derecho, :Lado_derecho_inf, :Tablero,
      :Guantera, :Consola, :MotorVehiculo_foto, :Acumulador_foto, :Espejo_retrovisor_foto,
      :Espejo_izquierdo_foto, :Espejo_derecho_foto, :Antena_foto, :Tapones_ruedas_foto,
      :Radio_foto, :Encendedor_foto, :Gato_foto, :Herramienta_foto, :Llanta_refaccion_foto,
      :Limpiadores_foto, :Pintura_rayada_foto, :Cristales_rotos_foto, :Golpes_foto,
      :Tapetes_foto, :Extintor_foto, :Tapones_gasolina_foto, :Calaveras_rotas_foto,
      :Molduras_completas_foto, :Panel_instrumentos_foto, :Lado_izquierdo_foto,
      :Lado_izquierdo_inf_foto, :Lado_derecho_foto, :Lado_derecho_inf_foto, :Tablero_foto,
      :Guantera_foto, :Consola_foto, :MotorVehiculo_video, :Acumulador_video,
      :Espejo_retrovisor_video, :Espejo_izquierdo_video, :Espejo_derecho_video,
      :Antena_video, :Tapones_ruedas_video, :Radio_video, :Encendedor_video, :Gato_video,
      :Herramienta_video, :Llanta_refaccion_video, :Limpiadores_video, :Pintura_rayada_video,
      :Cristales_rotos_video, :Golpes_video, :Tapetes_video, :Extintor_video,
      :Tapones_gasolina_video, :Calaveras_rotas_video, :Molduras_completas_video,
      :Panel_instrumentos_video, :Lado_izquierdo_video, :Lado_izquierdo_inf_video,
      :Lado_derecho_video, :Lado_derecho_inf_video, :Tablero_video, :Guantera_video,
      :Consola_video, :IdFlotilla, :IdOrdenServicio, :Activo
    )
  end
end
