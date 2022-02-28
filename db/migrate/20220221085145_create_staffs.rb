class CreateStaffs < ActiveRecord::Migration[7.0]
  def change
    create_table :staffs do |t|
      t.string :employee_name
      t.string :email
      t.string :password
      t.string :gender
      t.string :hobbies
      t.string :address
      t.integer :mobile_number
      t.datetime :birth_date

      t.timestamps
    end
  end
end
