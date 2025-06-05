class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.integer :IdUsuario
      t.string :Nombre
      t.string :Password
      t.integer :Rol
      t.integer :Estatus

      t.timestamps
    end
  end
end
