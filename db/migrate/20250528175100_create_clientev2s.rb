class CreateClientev2s < ActiveRecord::Migration[8.0]
  def change
    create_table :clientev2s do |t|
      t.string :nombre
      t.string :calle
      t.string :colonia
      t.string :ciudad
      t.string :estado
      t.string :tel
      t.string :cel
      t.string :email
      t.string :rfc
      t.string :autorizacion_ext
      t.string :no_int
      t.string :facturar_a
      t.integer :id_empleado

      t.timestamps
    end
  end
end
