class CreateFlotillas < ActiveRecord::Migration[7.1]
  def change
    create_table :flotillas do |t|
      t.integer :IdFlotilla
      t.string :NamesFlotillas
      t.string :Encargado

      t.timestamps
    end
  end
end
