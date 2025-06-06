class Api::Clientes::ClientesController < ApplicationController
  def index
    clientes = ClienteServices.listar
    render json: clientes
  end

  def show
    cliente = ClienteServices.buscar(params[:id])
    if cliente
      render json: cliente
    else
      render json: { error: 'Cliente no encontrado' }, status: :not_found
    end
  end

  def create
    cliente = ClienteServices.crear(cliente_params)
    if cliente.persisted?
      render json: cliente, status: :created
    else
      render json: cliente.errors, status: :unprocessable_entity
    end
  end

  def update
    cliente = ClienteServices.actualizar(params[:id], cliente_params)
    if cliente
      render json: cliente
    else
      render json: { error: 'No se pudo actualizar' }, status: :not_found
    end
  end

  def destroy
    if ClienteServices.eliminar(params[:id])
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
