class Faculty < ApplicationRecord
    validates :first_name,:last_name, presence: true
    validates :phone_number, format: {with: /\A[0-9]{10}\z/ }
    validates :email, presence: true, uniqueness: true
    validates :designation, exclusion: { in: %w(HOD Sr.Prof.) },inclusion: { in: %w(Ass.Prof. Prof) ,
        message: "can't be %{value}" }
    t=Time.new
    t=t.strftime("%Y-%m-%d")
    validates :DOB,comparison: {less_than_or_equal_to: t,message:"birthday can't be in future"}
    
end
