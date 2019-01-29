require 'rails_helper'

RSpec.feature 'Sign up user' do
  scenario 'with valid email and password' do
      visit "/"

      click_link 'Signup'

      fill_in "Email", with: "kuba@wp.pl"
      fill_in "Password", with: "haslo123"
      fill_in "Password confirmation", with: "haslo123"

      click_button "Signup"
      
      expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
