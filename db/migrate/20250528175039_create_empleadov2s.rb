class CreateEmpleadov2s < ActiveRecord::Migration[8.0]
  def change
    create_table :empleadov2s do |t|
      t.string :nombre
      t.string :rol
      t.string :estatus
      t.integer :id_usuario

      t.timestamps
    end
  end
end
