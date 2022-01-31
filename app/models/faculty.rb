class Faculty < ApplicationRecord
    validates :first_name,:last_name, presence: true
    validates :phone_number, format: {with: /\A[0-9]{10}\z/ }
    validates :email, presence: true, uniqueness: true
    #validates_comparison_of :DOB, less_than: -> { Date.today }
    validates :designation, exclusion: { in: %w(HOD Sr.Prof.) },inclusion: { in: %w(Ass.Prof. Prof) ,
        message: "can't be %{value}" }
     #validate :DOB_cannot_be_in_the_future

    # def DOB_cannot_be_in_the_future
    #     if DOB.present? && DOB > Date.today
    #       errors.add(:DOB, "can't be in the future")
    #     end
    #   end
end
