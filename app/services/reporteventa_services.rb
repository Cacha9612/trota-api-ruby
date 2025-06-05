# app/services/reporte_venta_service.rb
class ReporteVentaService
  def self.create_with_data(params)
    reporte = ReporteVenta.new(params)
    if reporte.save
      reporte
    else
      raise ActiveRecord::RecordInvalid, reporte
    end
  end

  def self.all
    ReporteVenta.all.order(created_at: :desc)
  end

  def self.find(id)
    ReporteVenta.find(id)
  end
end
