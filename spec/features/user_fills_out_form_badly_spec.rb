require 'rails_helper'
require 'carrierwave/test/matchers'

feature 'form validates user input', %Q{
  As a user I must fill out the sign up form correctly
} do

  scenario 'user signs up with non-unique username' do

    visit "/"

    click_on "Signing up!"

    fill_in "Username", with: "supertest"
    fill_in "Password", with: "12345"
    fill_in "Confirm your password", with: "12345"
    attach_file("Avatar", "#{Rails.root}/app/assets/images/avatar.jpg")
    click_on "Sign up!"

    expect(page).to have_content "supertest"
    expect(User.count).to eq(1)

    click_on "Logout"

    expect(page).to_not have_content "supertest"

    click_on "Signing up!"

    fill_in "Username", with: "supertest"
    fill_in "Password", with: "12345"
    fill_in "Confirm your password", with: "12345"
    attach_file("Avatar", "#{Rails.root}/app/assets/images/avatar.jpg")
    click_on "Sign up!"

    expect(page).to have_content "Form submission failed"
    expect(page).to have_content "Username has already been taken"
    expect(page).to_not have_content "supertest"
    expect(User.count).to eq(1)
  end

  scenario 'user signs up with non-matching passwords' do

    visit "/"

    click_on "Signing up!"

    fill_in "Username", with: "supertest"
    fill_in "Password", with: "12345"
    fill_in "Confirm your password", with: "123456"
    attach_file("Avatar", "#{Rails.root}/app/assets/images/avatar.jpg")
    click_on "Sign up!"

    expect(page).to_not have_content "supertest"
    expect(page).to have_content "Form submission failed"
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(User.count).to eq(0)
  end

  scenario 'user signs up with no avatar' do

    visit "/"

    click_on "Signing up!"

    fill_in "Username", with: "supertest"
    fill_in "Password", with: "12345"
    fill_in "Confirm your password", with: "12345"
    click_on "Sign up!"

    expect(page).to_not have_content "supertest"
    expect(page).to have_content "Form submission failed"
    expect(page).to have_content "Avatar can't be blank"
    expect(User.count).to eq(0)
  end

  scenario 'user signs up with blank username' do

    visit "/"

    click_on "Signing up!"

    fill_in "Username", with: ""
    fill_in "Password", with: "12345"
    fill_in "Confirm your password", with: "12345"
    attach_file("Avatar", "#{Rails.root}/app/assets/images/avatar.jpg")
    click_on "Sign up!"

    expect(page).to_not have_content "supertest"
    expect(page).to have_content "Form submission failed"
    expect(page).to have_content "Username can't be blank"
    expect(User.count).to eq(0)
  end
end
