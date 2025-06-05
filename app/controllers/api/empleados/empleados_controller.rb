class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :update, :destroy]

  def por_usuario
  empleado = Empleado.find_by(IdUsuario: params[:id_usuario])

  if empleado
    render json: empleado
  else
    render json: { error: "Empleado no encontrado" }, status: :not_found
  end
  def show
    if @empleado
      render json: @empleado
    else
      render json: { error: "Empleado no encontrado" }, status: :not_found
    end
  end

  def create
    empleado = EmpleadoService.crear_empleado(empleado_params)
    if empleado.persisted?
      render json: empleado, status: :created
    else
      render json: { errors: empleado.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @empleado
      if EmpleadoService.actualizar_empleado(@empleado.id, empleado_params)
        render json: @empleado
      else
        render json: { errors: @empleado.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { error: "Empleado no encontrado" }, status: :not_found
    end
  end

  def destroy
    if @empleado
      EmpleadoService.eliminar_empleado(@empleado.id)
      render json: { message: "Empleado eliminado correctamente" }
    else
      render json: { error: "Empleado no encontrado" }, status: :not_found
    end
  end

  private

  def set_empleado
    @empleado = Empleado.find_by(id: params[:id])
  end

  def empleado_params
    params.require(:empleado).permit(:IdUsuario, :Nombre, :Rol, :Estatus)
  end
end
