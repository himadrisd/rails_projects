class AddDateToOders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :date, :date, :default => Time.now.to_date.strftime('%d/%m/%Y')
  end
end
