class Image < ApplicationRecord
    belongs_to :author
    belongs_to :book
end
