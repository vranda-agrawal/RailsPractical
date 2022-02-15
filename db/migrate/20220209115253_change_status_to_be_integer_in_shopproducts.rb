class ChangeStatusToBeIntegerInShopproducts < ActiveRecord::Migration[7.0]
  def change
      change_column :shopproducts, :status, :integer
  end
end
