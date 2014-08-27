require 'rails_helper'

feature 'user can sign into their avatars account', %Q{
  As a user I want to sign in to see my avatar
} do

  scenario 'user signs up, logs out, logs in' do

    visit "/"

    click_on "Signing up!"

    fill_in "Username", with: "supertest"
    fill_in "Password", with: "12345"
    fill_in "Confirm your password", with: "12345"
    attach_file("Avatar", "#{Rails.root}/app/assets/images/avatar.jpg")
    click_on "Sign up!"

    click_on "Logout"

    expect(page).to_not have_content "supertest"
    expect(User.count).to eq(1)

    click_on "Logging in!"

    fill_in "Username", with: "supertest"
    fill_in "Password", with: "12345"
    click_on "Log in!"

    expect(page).to have_content "supertest"
    expect(User.count).to eq(1)
  end
end
