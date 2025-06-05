class Checklist < ApplicationRecord
  self.table_name = "checklists"

  # Asociaciones (si aplican, por ejemplo:)
  belongs_to :empleado, class_name: "Empleado", foreign_key: "IdEmpleado", optional: true
  belongs_to :vehiculo, class_name: "Vehiculo", foreign_key: "IdVehiculo", optional: true

  # Validaciones (opcional)
  validates :Fecha, presence: true
end
