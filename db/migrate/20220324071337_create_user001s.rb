class CreateUser001s < ActiveRecord::Migration[7.0]
  def change
    create_table :user001s do |t|
      t.string :name
      t.string :email
      t.string :picture

      t.timestamps
    end
  end
end
