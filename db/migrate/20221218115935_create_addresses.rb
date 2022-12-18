class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :customer_id

      t.timestamps
    end
  end
end
