class Empleado < ApplicationRecord
  
  belongs_to :role, foreign_key: 'Id_Rol', class_name: 'Role' 
  enum Estatus: { inactivo: 0, activo: 1 }

  validates :IdUsuario, presence: true, uniqueness: true
  validates :Nombre, presence: true

  #def rol_nombre
   # rol&.Descripcion || "Desconocido"
  #end
end
