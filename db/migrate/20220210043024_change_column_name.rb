class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :product_id, :shopproduct_id
  end
end
