class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|

      t.timestamps
      t.integer :order_id, null: false 
      t.integer :item_id, null: false 
      t.integer :amount, null: false  
      t.integer :price, null: false  
        
    end
  end
end
