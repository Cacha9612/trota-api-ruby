class ClientesController < ApplicationController
  def index
    clientes = ClientesService.listar
    render json: clientes
  end

  def show
    cliente = ClientesService.buscar(params[:id])
    if cliente
      render json: cliente
    else
      render json: { error: 'Cliente no encontrado' }, status: :not_found
    end
  end

  def create
    cliente = ClientesService.crear(cliente_params)
    if cliente.persisted?
      render json: cliente, status: :created
    else
      render json: cliente.errors, status: :unprocessable_entity
    end
  end

  def update
    cliente = ClientesService.actualizar(params[:id], cliente_params)
    if cliente
      render json: cliente
    else
      render json: { error: 'No se pudo actualizar' }, status: :not_found
    end
  end

  def destroy
    if ClientesService.eliminar(params[:id])
      head :no_content
    else
      render json: { error: 'Cliente no encontrado' }, status: :not_found
    end
  end

  private

  def cliente_params
    params.require(:cliente).permit(:Facturar_a, :Nombre, :Calle, :Colonia, :Ciudad, :Estado, :No_int, :Tel, :Cel, :Email, :RFC, :Id_empleado)
  end
end
