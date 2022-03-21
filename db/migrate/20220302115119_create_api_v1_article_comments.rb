class CreateApiV1ArticleComments < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_article_comments do |t|
      t.string :comment
      t.datetime :date_of_comment
      t.integer :article_id

      t.timestamps
    end
  end
end
