class CreateFoodProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :food_products do |t|
      t.string :name
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
