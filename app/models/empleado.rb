class Empleado < ApplicationRecord
  enum Rol: { Administrador: 0, Almacén: 1, Técnicos: 2, Jefé_Taller: 3 }
  enum Estatus: { inactivo: 0, activo: 1 }

  validates :IdUsuario, presence: true, uniqueness: true
  validates :Nombre, presence: true
end


