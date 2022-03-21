class MyUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: { merchant: 0, admin: 1 } 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
