# app/models/reporte_venta.rb
class ReporteVentum < ApplicationRecord

    self.table_name = 'reporteventa'

  belongs_to :service_order, optional: true
  belongs_to :vehicle, optional: true

  validates :date, presence: true
  # Agrega más validaciones según tu lógica de negocio
end
