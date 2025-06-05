class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :Facturar_a
      t.string :Nombre
      t.string :Calle
      t.string :Colonia
      t.string :Ciudad
      t.string :Estado
      t.integer :No_int
      t.string :Tel
      t.string :Cel
      t.string :Email
      t.string :RFC
      t.integer :Id_empleado

      t.timestamps
    end
  end
end
