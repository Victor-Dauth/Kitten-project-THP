class AddRecapOrderToOders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :recap_order, index: true
  end
end
