FactoryBot.define do
	factory :my_user do
		email { Faker::Internet.unique.email }
		password  { Faker::Internet.unique.password }
		role {"admin"}
	end
end 
