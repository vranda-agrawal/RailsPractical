require 'rails_helper'

RSpec.describe Myuser, type: :request do

  it "gets all users" do
    user = Myuser.create(email: "tanisha@gmail.com",role: "admin",password: "tanisha@123")
    get new_myuser_registration_path
    #get myusers_path
    expect(response).to be_successful
    #expect(response.body).to include("admin")
  end

end 