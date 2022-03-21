class Api::V1::ArticleComment < ApplicationRecord
  belongs_to :article, class_name: 'Api::V1::Article'
  validates :article_id, presence: true
end
