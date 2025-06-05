class CreateEstatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :estatuses do |t|
      t.integer :Id_Estatus
      t.string :Descripcion

      t.timestamps
    end
  end
end
