# app/models/role.rb
class Role < ApplicationRecord
  self.table_name = 'roles' # explícitamente definimos la tabla, aunque Rails ya lo haría así

  has_many :empleados, foreign_key: 'Id_Rol'

  # Asegúrate de que Descripcion esté bien escrito y sin errores de acentos si los carga mal.
end
