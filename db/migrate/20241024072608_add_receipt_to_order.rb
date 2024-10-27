class AddReceiptToOrder < ActiveRecord::Migration[7.2]
  def up
    add_column :orders, :receipt, :string
  end
  def down
  remove_column :orders, :receipt, :string
  end
end
