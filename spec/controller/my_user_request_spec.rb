require 'rails_helper'

RSpec.describe MyUser, type: :request do
  it "gets all users" do
      get my_user_index_path
      expect(response).to be_successful
  end

end 
