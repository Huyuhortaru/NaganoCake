class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :status
      t.integer :customer_id
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      
      #add_column :orders, :status, :integer,          null: false, default: 0
      #add_column :orders, :payment_method, :integer,  null: false, default: 0
      
      t.timestamps
    end
  end
end
