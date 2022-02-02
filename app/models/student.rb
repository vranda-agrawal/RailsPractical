class DestroyCallback
	def after_destroy(obj)
		puts "------------------object destroyed successfully----------------"
	end
end

class Student < ApplicationRecord
	validates :first_name, :last_name , presence: true
	validates :department, inclusion: { in: %w(IT CE), message: "can't be %{value}" }
	validates :Terms_Of_Condition, acceptance: { message: 'must be abided' }
	t=Time.new
	t=t.strftime("%Y-%m-%d")
	validates :DOB,comparison: {less_than_or_equal_to: t,message:"birthday can't be in future"}
	before_validation :check_DOB
	after_destroy DestroyCallback.new , if: after_destroy_commit

	#ater_initialize callback
	after_initialize do |student|
		puts "Student object has been initialized"
	end

	#after_find callback will be called whenever active record loads the data
	after_find do |student|
		puts "Student Object has been found"
	end

	#after_create callback
	after_create do |student|
		puts "Student object has been created"
	end
  
	#after_update callback
	after_update do |student|
		puts "Student object updated"
	end

	#after_destroy callback (It will only be run when you use destroy)
	after_destroy do |student|
		puts "Student object has been destroyed"
	end

	after_save do |student|
		puts "-------------------------DOB is validated------------------------"
	end

	private
		def check_DOB
			puts "DOB is : #{self.DOB}"
		end

end
