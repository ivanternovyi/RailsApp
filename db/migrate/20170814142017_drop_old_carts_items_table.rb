class DropOldCartsItemsTable < ActiveRecord::Migration[5.0]

  def change
    drop_table :items_orders
    remove_column :orders, :total, :float
  end

end
