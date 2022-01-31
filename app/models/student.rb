class Student < ApplicationRecord
    validates :first_name, :last_name , presence: true
    validates :department, inclusion: { in: %w(IT CE),
        message: "can't be %{value}" }
    validates :Terms_Of_Condition, acceptance: { message: 'must be abided' }
    # t=Time.new
    # t=t.strftime("%d/%m/%y")
    # validates :DOB,comparison: {less_than_or_equal_to: t,message:"birthday can't be in future"}
    # # validate :DOB_cannot_be_in_the_future

    # def DOB_cannot_be_in_the_future
    #     if DOB.present? && DOB > Date.today
    #       errors.add(:DOB, "can't be in the future")
    #     end
    #   end
    
end
