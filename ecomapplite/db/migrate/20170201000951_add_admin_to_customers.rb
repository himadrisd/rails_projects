class AddAdminToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :admin, :boolean, default: false
  end
end
