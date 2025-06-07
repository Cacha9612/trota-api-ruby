# app/models/role.rb
class Role < ApplicationRecord
  self.table_name = 'roles'
  has_many :empleados, foreign_key: 'Id_Rol'
end
