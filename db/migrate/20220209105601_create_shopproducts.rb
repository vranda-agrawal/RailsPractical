class CreateShopproducts < ActiveRecord::Migration[7.0]
  def change
    create_table :shopproducts do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.integer :capacity
      t.boolean :is_active
      t.string :status

      t.timestamps
    end
  end
end
