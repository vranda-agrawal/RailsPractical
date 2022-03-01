class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.date :event_name
      t.integer :user_id

      t.timestamps
    end
  end
end
