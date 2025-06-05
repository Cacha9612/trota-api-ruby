class Empleado < ApplicationRecord
  enum rol: { administrador: 0, supervisor: 1, empleado: 2 }
  enum estatus: { inactivo: 0, activo: 1 }

  validates :IdUsuario, presence: true, uniqueness: true
  validates :Nombre, presence: true
end
