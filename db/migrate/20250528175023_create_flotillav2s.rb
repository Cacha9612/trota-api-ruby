class CreateFlotillav2s < ActiveRecord::Migration[8.0]
  def change
    create_table :flotillav2s do |t|
      t.string :namesflotillas
      t.string :encargado
      t.integer :id_flotilla

      t.timestamps
    end
  end
end
