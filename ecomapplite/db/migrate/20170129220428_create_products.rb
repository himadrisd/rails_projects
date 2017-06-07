class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products, id:false do |t|
      t.string :name, null: false
      t.integer :id, auto_increment: true, primary_key: true
      t.float :price, default: 0, null: false
      t.string :description, null: false
      t.integer :status, null: false

#      t.timestamps
    end
  end
end
