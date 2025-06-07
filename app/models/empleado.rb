class Empleado < ApplicationRecord
  enum Rol: {
    administrador: 1,
    almacen: 2,
    tecnicos: 3,
    jefe_de_taller: 4
  }

  enum Estatus: {
    inactivo: 0,
    activo: 1
  }


  validates :IdUsuario, presence: true, uniqueness: true
  validates :Nombre, presence: true
end


