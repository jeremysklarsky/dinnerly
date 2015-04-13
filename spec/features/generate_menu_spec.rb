require 'rails_helper'

RSpec.feature "Generate Menu", type: :feature do
  
  let!(:user) { FactoryGirl.create(:user) }
  # after(:each) {DatabaseCleaner.clean}

  # scenario 'user can create a dinner', :js => true do
    
  #   visit root_path
  #   click_link "log in"
  #   fill_in "Email", :with => user.email
  #   fill_in "Password", :with => user.password
  #   click_button "Log In"

  #   click_link "Create Dinner"
  #   fill_in "Name", :with => "Fancy Dinner"
  #   fill_in "Location", :with => "here"
  #   fill_in "date-input", :with => "May 1, 2016"
  #   click_button "Create Dinner"
  #   expect(page).to have_content("Fancy Dinner")
  #   expect(page).to have_content("here")
  # end  

  scenario 'user can create menu', :js => true do 
    visit root_path
    click_link "log in"
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Log In"

    click_link "Create Dinner"
    fill_in "Name", :with => "Fancy Dinner"
    fill_in "Location", :with => "here"
    fill_in "date-input", :with => "May 1, 2016"
    click_button "Create Dinner"

    fill_in "No. of Appetizers", :with => 2
    fill_in "No. of Sides", :with => 2
    fill_in "No. of Main Dishes", :with => 2
    fill_in "No. of Desserts", :with => 2
    click_button "Create Menu!"
    sleep(3)
    visit current_path
    binding.pry
    expect(page.html).to include('input type="checkbox"', :count => 16)

    # have_css("", :count => 2)

  end

end
