require 'rails_helper'

RSpec.feature 'Listing memebers' do
  before do
    @john = create(:user)
    @lara = create(:user)
  end

  scenario "shows a list of registered members" do
    visit "/"

    expect(page).to have_content("List of Members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@lara.full_name)
  end

end
