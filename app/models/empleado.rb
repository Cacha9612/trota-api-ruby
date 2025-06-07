class Empleado < ApplicationRecord
  enum Rol: { 1: 1, 2: 2, 4: 3, 4: 4 }
  enum Estatus: { Inactivo: 0, Activo: 1 }

  validates :IdUsuario, presence: true, uniqueness: true
  validates :Nombre, presence: true
end


