class CreateEmpleados < ActiveRecord::Migration[7.1]
  def change
    create_table :empleados do |t|
      t.integer :IdUsuario
      t.string :Nombre
      t.integer :Rol
      t.integer :Estatus

      t.timestamps
    end
  end
end
