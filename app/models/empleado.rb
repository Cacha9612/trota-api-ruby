class Empleado < ApplicationRecord
  enum Rol: { Administrador: 1, Almacén: 2, Técnicos: 3, Jefé_Taller: 4 }
  enum Estatus: { Inactivo: 0, Activo: 1 }

  validates :IdUsuario, presence: true, uniqueness: true
  validates :Nombre, presence: true
end


