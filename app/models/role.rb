class Rol < ApplicationRecord
  self.table_name = 'roles' # si no sigue la convención de pluralización

  has_many :empleados, foreign_key: 'Id_Rol'

  # Asegúrate de que Descripcion esté bien escrito y sin errores de acentos si los carga mal.
end
