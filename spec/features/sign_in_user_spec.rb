require 'rails_helper'

RSpec.feature 'Sign in user' do
  before do
    @user = create(:user)
  end
  scenario 'with valid credentials' do
    visit "/"

    click_link "Log in"

    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).not_to have_link("Signup")
    expect(page).not_to have_link("Log in")
    expect(page).to have_link("Sign out")
    expect(page).to have_link("Signed in as #{@user.email}")

  end
end
