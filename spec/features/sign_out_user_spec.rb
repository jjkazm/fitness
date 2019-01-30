require 'rails_helper'

RSpec.feature 'Sign out' do
  before do
    @kuba = create(:user)
    sign_in @kuba
  end

  scenario 'user sign outs succesfully' do
    visit '/'

    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")
    expect(page).to have_link("Signup")
    expect(page).to have_link("Log in")
    expect(page).not_to have_link("Sign out")
    expect(page).not_to have_link("Signed in as")
  end
end
