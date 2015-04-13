require 'rails_helper'

RSpec.feature "Generate Menu", type: :feature do
  
  before(:each) do 
    visit root_path
    user = create(:user)
    click_link "log in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    binding.pry
    click_button "Log In"

  end

  after(:each) { click_link "Log Out"}

  scenario 'user can create a dinner', :js => true do
    click_link "Create Dinner"
    fill_in "Name", :with => "Fancy Dinner"
    fill_in "Location", :with => "here"
    fill_in "Date", :with => "May 1, 2016"
    click_button "Create Dinner"
    expect(page).to have_content("Fancy Dinner")
    expect(page).to have_content("here")
  end

end
