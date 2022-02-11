class Student < ApplicationRecord
    validates :first_name, :last_name , presence: true
    validates :department, inclusion: { in: %w(IT CE), message: "can't be %{value}" }
    validates :Terms_Of_Condition, acceptance: { message: 'must be abided' }
    validates :DOB,comparison: {less_than_or_equal_to: Date.today,message:"birthday can't be in future"}
    
end
