class Vehiculo < ApplicationRecord

  validates :Marca, presence: true
  validates :Placa, uniqueness: true, allow_blank: true

  belongs_to :empleado, foreign_key: "Id_Empleado", optional: true

end
