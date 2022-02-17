class Event < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :enrols, dependent: :destroy
	has_many :users,through: :enrols

end
