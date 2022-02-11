class AddTermsOfConditionToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :Terms_Of_Condition, :boolean
  end
end
