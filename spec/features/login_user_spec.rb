require 'rails_helper'

RSpec.feature "Login User", type: :feature do
  
  # scenario 'user can sign up', :js => true do
  #   visit root_path
  #   click_link("Sign up") 
  #   fill_in("Name", :with => "Amy Poehler")
  #   fill_in("Email", :with => "amy@gmail.com")
  #   fill_in("Password", :with => "foobar")
  #   fill_in("Password confirmation", :with => "foobar")
  #   click_button "Sign Up"
    
  #   expect(page).to have_content("Welcome, Amy Poehler")
  # end
  
  scenario 'user can sign up, log out, and log in', :js => true do 
    visit root_path
    click_link("Sign up") 
    fill_in("Name", :with => "Amy Poehler")
    fill_in("Email", :with => "amy@gmail.com")
    fill_in("Password", :with => "foobar")
    fill_in("Password confirmation", :with => "foobar")
    click_button "Sign Up"
    
    click_link "Log Out"
    click_link "log in"
    fill_in "Email", :with => "amy@gmail.com"
    fill_in "Password", :with => "foobar"
    click_button "Log In"

    expect(page).to have_content("Welcome Amy Poehler!")
  end
end