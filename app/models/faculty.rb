class Faculty < ApplicationRecord
    validates :first_name,:last_name, presence: true
    validates :phone_number, format: {with: /\A[0-9]{10}\z/ }
    validates :email, presence: true, uniqueness: true
    validates :designation, exclusion: { in: %w(HOD Sr.Prof.) },inclusion: { in: %w(Ass.Prof. Prof) ,
        message: "can't be %{value}" }
    t=Time.new
    t=t.strftime("%Y-%m-%d")
    validates :DOB,comparison: {less_than_or_equal_to: t,message:"birthday can't be in future"}
    after_validation :check_DOB
    after_commit :Email_Validated

    #ater_initialize callback
    after_initialize do |faculty|
        puts "Faculty object has been initialized"
    end

    #after_find callback will be called whenever active record loads the data
    after_find do |faculty|
        puts "Faculty Object has been found"
    end

    #after_create callback
    after_create do |faculty|
        puts "Faculty object has been created"
    end

    #after_update callback
    after_update do |faculty|
        puts "Faculty object updated"
    end

    #after_destroy callback (It will only be run when you use destroy)
    after_destroy do |faculty|
        puts "Faculty object has been destroyed"
    end

    private
      def check_DOB
          puts "DOB is : #{self.DOB}"
      end

      def show_Email_validated
        puts "-------------------------------Email validated---------------------------------"
      end
end
