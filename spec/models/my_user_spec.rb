require 'rails_helper'

RSpec.describe MyUser,type: :model do
  let(:my_user) { build(:my_user) }
    #@my_user=MyUser.new(email:'admin1@gmail.com',password:'Vranda@123',role:1)
  
  it "should be valid with valid attribute" do
    my_user.email=nil
    expect(my_user).to_not be_valid
  end

  it "Email should not be empty" do
    my_user.email=" "
    expect(my_user).to_not be_valid
  end

  it "password should not be empty" do
    my_user.password = nil
    expect(my_user).to_not be_valid
  end

  it "Role should not be empty" do
    my_user.role = nil
    expect(my_user).to_not be_valid
  end

  it "password should be in correct format" do
    my_user.password = 'admin'
    expect( my_user).to_not be_valid
  end

end
 