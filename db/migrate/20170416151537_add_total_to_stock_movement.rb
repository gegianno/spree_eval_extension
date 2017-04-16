class AddTotalToStockMovement < ActiveRecord::Migration
  def up
    add_column :spree_stock_movements, :total, :integer, default: 0
    change_column_null :spree_stock_movements, :total, 0
  end
  def down
    remove_column :spree_stock_movements, :total, :integer
  end
end
