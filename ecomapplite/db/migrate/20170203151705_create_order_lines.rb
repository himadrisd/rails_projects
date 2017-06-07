class CreateOrderLines < ActiveRecord::Migration[5.0]
  def change
    create_table :order_lines, id:false do |t|
      t.integer :id, auto_increment: true, primary_key: true
      t.references :order, index: true
      t.references :product, index: true
      t.integer :qty, default: 0, null: false
      t.decimal :unit_price, default: 0, null: false, :precision => 8, :scale => 2
      t.decimal :total_price, default: 0, null: false, :precision => 10, :scale => 2
#      t.decimal :total_price, default: (:qty * :unit_price), null: false, :precision => 10, :scale => 2
    end

'''
    execute "alter table order_lines add constraint fk_order_line_products \
			foreign key (product_id) references products(id)"

	execute "alter table order_lines add constraint fk_order_line_orders \
			foreign key (order_id) references orders(id)"
 '''



  end
  
end
