require 'rails_helper'

RSpec.feature 'Sign up user' do
  scenario 'with valid email and password' do
      visit "/"

      click_link 'Signup'

      fill_in "First name", with: "Kuba"
      fill_in "Last name", with: "Doe"
      fill_in "Email", with: "kuba@wp.pl"
      fill_in "Password", with: "haslo123"
      fill_in "Password confirmation", with: "haslo123"

      click_button "Signup"

      expect(page).to have_content "Welcome! You have signed up successfully."
      expect(page).not_to have_link("Signup")
      expect(page).not_to have_link("Log in")
      expect(page).to have_link("Sign out")
      expect(page).to have_link("Signed in as kuba@wp.pl")
      expect(page).to have_content("Kuba Doe")
  end
  scenario 'with invalid credentials' do
      visit "/"

      click_link 'Signup'

      fill_in "First name", with: ""
      fill_in "Last name", with: ""
      fill_in "Email", with: "kuba@wp.pl"
      fill_in "Password", with: "haslo123"
      fill_in "Password confirmation", with: "haslo123"

      click_button "Signup"


      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
      expect(page).not_to have_content "Welcome! You have signed up successfully."
      expect(page).to have_link("Signup")
      expect(page).to have_link("Log in")
      expect(page).not_to have_link("Sign out")
      expect(page).not_to have_link("Signed in as kuba@wp.pl")
  end


end
