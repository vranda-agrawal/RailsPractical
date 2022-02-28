class CreateFoodOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :food_orders do |t|
      t.integer :quantity
      t.integer :food_prouct_id

      t.timestamps
    end
  end
end
