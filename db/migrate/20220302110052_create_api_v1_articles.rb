class CreateApiV1Articles < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_articles do |t|
      t.string :title
      t.string :description
      t.datetime :release_date

      t.timestamps
    end
  end
end
