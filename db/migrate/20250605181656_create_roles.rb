class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.integer :Id_Rol
      t.string :Descripcion
      t.integer :Estatus

      t.timestamps
    end
  end
end
