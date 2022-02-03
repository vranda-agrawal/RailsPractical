class Author < ApplicationRecord
	validates :first_name, presence: true, length: {maximum: 15}
	validates :last_name, presence: true, length: {maximum: 15}
	validates :email, presence: true , uniqueness: true 
	
	has_many :books
	has_many :images
	
end
