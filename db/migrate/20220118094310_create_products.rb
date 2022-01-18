class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.integer :cost
      t.integer :quantity 
      t.timestamps
    end
  end
end
