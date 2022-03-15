class NewUser < ApplicationRecord
  validate :check_password, on: :update
    def check_password
        u = NewUser.find_by_id(self.id)
        puts "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
        puts u.password
        puts self.password
        puts "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
        if self.password != u.password
            errors.add(:base, "Password is incorrect.")
        end
    end
end
