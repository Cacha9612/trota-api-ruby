class CreateAsignarordens < ActiveRecord::Migration[7.1]
  def change
    create_table :asignarordens do |t|
      t.integer :IdOrden
      t.integer :IdTecnico

      t.timestamps
    end
  end
end
