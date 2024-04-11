class CreateInvoiceItems < ActiveRecord::Migration[7.1]
  def change
    create_table :invoice_items do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :qty
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
