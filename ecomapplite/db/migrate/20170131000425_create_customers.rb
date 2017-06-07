class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers, id:false do |t|
      t.integer :id, auto_increment: true, primary_key: true
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest

#      t.timestamps
    end
  end
end
