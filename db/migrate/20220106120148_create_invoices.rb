class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.integer :discount
      t.datetime :date
      t.integer :amount
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
    add_index :clients, [:client_id, :created_at]
  end
end
