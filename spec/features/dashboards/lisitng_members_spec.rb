require 'rails_helper'

RSpec.feature 'Listing memebers' do
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password")
    @lara = User.create(first_name: "Lara", last_name: "Doe", email: "lara@doe.com", password: "password")
  end

  scenario "shows a list of registered members" do
    visit "/"

    expect(page).to have_content("List of Members")
    expect(page).to have content(@john.full_name)
    expect(page).to have content(@lara.full_name)
  end

end
