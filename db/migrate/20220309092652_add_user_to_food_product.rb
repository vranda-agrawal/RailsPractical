class AddUserToFoodProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_products, :my_user, null: true, foreign_key: true
  end
end
