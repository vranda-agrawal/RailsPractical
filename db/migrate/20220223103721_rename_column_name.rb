class RenameColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :Food_Orders, :food_prouct_id, :food_product_id
  end
end
