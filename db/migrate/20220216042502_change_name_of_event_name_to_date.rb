class ChangeNameOfEventNameToDate < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :event_name,:date
  end
end
