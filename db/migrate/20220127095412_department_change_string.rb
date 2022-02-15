class DepartmentChangeString < ActiveRecord::Migration[7.0]
  def change
    change_column(:Students, :department, :string)
  end
end
