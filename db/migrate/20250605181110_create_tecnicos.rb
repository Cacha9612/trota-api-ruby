class CreateTecnicos < ActiveRecord::Migration[7.1]
  def change
    create_table :tecnicos do |t|
      t.integer :IdUsuario
      t.string :Nombre
      t.integer :Estatus

      t.timestamps
    end
  end
end
