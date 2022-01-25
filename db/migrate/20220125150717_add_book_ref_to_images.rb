class AddBookRefToImages < ActiveRecord::Migration[7.0]
  def change
    add_reference :images, :book, null: true, foreign_key: true
  end
end
