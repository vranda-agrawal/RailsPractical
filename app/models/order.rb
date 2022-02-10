class Order < ApplicationRecord
	belongs_to :shopproduct 
	belongs_to :customer 
  enum status: { booked:0,cancelled:1}

	before_save do |order|
		puts order.id
		puts order.quantity
		puts order.shopproduct.price
		order.total_price=order.shopproduct.price*order.quantity
		puts "-------------------------Total price updated------------------------"
	end

end
