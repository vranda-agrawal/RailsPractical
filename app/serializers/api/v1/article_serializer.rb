class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :title, :description
end
