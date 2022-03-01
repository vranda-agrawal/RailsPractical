class DeleteColumnDocumentToStaff < ActiveRecord::Migration[7.0]
  def change
    remove_column :staffs, :document
  end
end
