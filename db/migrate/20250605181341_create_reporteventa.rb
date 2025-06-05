class CreateReporteventa < ActiveRecord::Migration[7.1]
  def change
    create_table :reporteventa do |t|
      t.string :date
      t.integer :service_order_id
      t.integer :vehicle_id
      t.string :credit
      t.string :initial_service
      t.integer :finalized
      t.boolean :reception
      t.boolean :entry
      t.boolean :repair
      t.boolean :checklist
      t.string :technician
      t.boolean :quotation
      t.boolean :authorization
      t.boolean :additional
      t.boolean :washing
      t.boolean :delivery
      t.string :comments

      t.timestamps
    end
  end
end
