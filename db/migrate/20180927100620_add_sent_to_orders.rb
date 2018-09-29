class AddSentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :sent, :boolean
  end
end
