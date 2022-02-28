class AddColumnDocumentToStaff < ActiveRecord::Migration[7.0]
  def change
    add_column :staffs, :document, :string
  end
end
