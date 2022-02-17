class User < ApplicationRecord
  has_one :address , dependent: :destroy
  #has_many :events 
  has_many :comments, dependent: :destroy
  has_many :enrols, dependent: :destroy
  has_many :events,through: :enrols
  has_secure_password

  before_destroy do |student|
    puts "User object has been destroyed"
    puts self.id
    event_list=Event.where(user_id: self.id)
    event_list.each do |e|
      e.destroy
    end
  end

end
