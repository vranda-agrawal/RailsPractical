class Api::V1::Article < ApplicationRecord
  has_many :article_comments, class_name: 'Api::V1::ArticleComment'
	validates :title, presence: true
end
