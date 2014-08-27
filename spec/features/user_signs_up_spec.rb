require 'rails_helper'
require 'carrierwave/test/matchers'

feature 'user can sign up for avatars', %Q{
  As a user I want to sign up so that I can create an avatar
} do

  scenario 'user signs up' do

    visit "/"

    click_on "Signing up!"

    fill_in "Username", with: "supertest"
    fill_in "Password", with: "12345"
    fill_in "Confirm your password", with: "12345"
    attach_file("Avatar", "#{Rails.root}/app/assets/images/avatar.jpg")
    click_on "Sign up!"

    expect(page).to have_content "supertest"
    expect(User.count).to eq(1)
    expect(User.first.avatar.file.file).to eq("/Users/aly/Dropbox/professional/avatars/public/uploads/user/avatar/#{User.first.id}/avatar.jpg")
  end
end
