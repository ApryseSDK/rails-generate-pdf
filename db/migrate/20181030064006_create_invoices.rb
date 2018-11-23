class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.string :from_full_name
      t.string :from_address
      t.string :from_email
      t.string :from_phone
      t.string :to_full_name
      t.string :to_address
      t.string :to_email
      t.string :to_phone
      t.string :status
      t.decimal :discount
      t.decimal :vat

      t.timestamps
    end
  end
end
