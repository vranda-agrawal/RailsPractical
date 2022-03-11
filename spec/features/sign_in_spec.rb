require 'rails_helper'
 
feature 'User signs in' do
  given!(:user) { MyUser.create(email:'vranda@gmail.com',password:'Vranda@123',role:"admin") }
 
  scenario 'with valid credentials' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    check 'Remember me'
    click_button 'Log in'
    expect(page).to have_content "Home Page"
  end
end
