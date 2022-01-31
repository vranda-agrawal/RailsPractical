class Student < ApplicationRecord
    validates :first_name, :last_name , presence: true
    validates :department, inclusion: { in: %w(IT CE),
        message: "can't be %{value}" }
    validates :Terms_Of_Condition, acceptance: { message: 'must be abided' }
    before_validation :ensure_last_name_has_a_value
    after_validation :change_value_of_the_departement
    
    #initialize callback
    
    after_initialize do |u|
        puts "You have initialized an object! #{u}"
      end
    
    #touch call back
    after_touch do |user|
      puts "You have touched an object"
    end
    
    private
      def ensure_last_name_has_a_value
        if last_name.nil?
            puts "last_name callback called"
            self.last_name="-"
        end
      end
      def change_value_of_the_departement
        if department == 'IT'
            puts "last_name callback called"
            self.department="Information technology"
        end
        if department == 'CE'
            puts "last_name callback called"
            self.department="Computer"
        end
      end
end
