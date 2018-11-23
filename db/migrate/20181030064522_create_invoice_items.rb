class CreateInvoiceItems < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_items do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :qty
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
