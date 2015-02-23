require 'rails_helper'

describe 'user can CRUD users' do

  scenario 'user can sign up' do
    visit '/signup'
    fill_in 'user[user_name]', with: "Johnny"
    fill_in 'user[password]', with: "appleseed"
    fill_in 'user[password_confirmation]', with: "appleseed"
    click_on "Sign Up"



    expect(page).to have_content("User was successfully created")
    expect(page).to have_content("Johnny")
  end

  scenario 'user can add course' do
    visit '/signup'
    fill_in 'user[user_name]', with: "Johnny"
    fill_in 'user[password]', with: "appleseed"
    fill_in 'user[password_confirmation]', with: "appleseed"
    click_on "Sign Up"
    click_on "Johnny"
    click_on "Add Course"
    fill_in 'course[title]', with: "Ruby"
    check 'course[day]'
    click_on "Create Course"

    expect(page).to have_content("Ruby")
    expect(page).to have_content("Day")
  end

end
