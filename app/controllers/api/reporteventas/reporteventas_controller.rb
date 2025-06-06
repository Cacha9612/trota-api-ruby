# app/controllers/reporte_ventas_controller.rb
class Api::ReporteVentas::ReporteVentasController < ApplicationController
  def index
    render json: ReporteVentaService.all
  end

  def show
    render json: ReporteVentaService.find(params[:id])
  end

  def create
    reporte = ReporteVentaService.create_with_data(reporte_venta_params)
    render json: reporte, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  private

  def reporte_venta_params
    params.require(:reporte_venta).permit(
      :date,
      :service_order_id,
      :vehicle_id,
      :credit,
      :initial_service,
      :finalized,
      :reception,
      :entry,
      :repair,
      :checklist,
      :technician,
      :quotation,
      :authorization,
      :additional,
      :washing,
      :delivery,
      :comments
    )
  end
end
