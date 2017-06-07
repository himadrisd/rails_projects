class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders, id:false do |t|
      t.integer :id, auto_increment: true, primary_key: true
      t.string  :order_no, null: false, :unique => true
      t.decimal :total, default: 0, :precision => 10, :scale => 2
      t.references :customer, index: true
    end

    #execute "alter table orders add constraint fk_order_customers \
    #  foreign key (customer_id) references customers(id)"

  end
end
