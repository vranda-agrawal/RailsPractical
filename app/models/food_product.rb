class FoodProduct < ApplicationRecord
  has_many :food_orders
  belongs_to :my_user
  validates_presence_of :name,:description,:price,:my_user_id
end
