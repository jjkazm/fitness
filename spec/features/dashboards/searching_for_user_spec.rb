require 'rails_helper'

RSpec.feature 'Searching for users' do
  before do
    @john = create(:user, first_name: "John", last_name: "Doe")
    @alice = create(:user, first_name: "Alice", last_name: "Doe")
  end

  scenario "with existing name returns all those users" do
    visit '/'

    fill_in "search_name", with: "Doe"
    click_button "Search"

    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@alice.full_name)
    expect(current_path).to eq("/dashboards/search")
  end
end
