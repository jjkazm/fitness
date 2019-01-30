require 'rails_helper'

RSpec.feature 'Creating excercise' do
  before do
    @kuba = create(:user)
    sign_in @kuba
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New workout"

    expect(page).to have_link "Back"

    fill_in "Duration", with: 70
    fill_in "Workout details", with: "Swimming"
    fill_in "Activity date", with: "2019-01-30"

    click_button "Create Exercise"

    expect(page).to have_content "Exercise has been created"

    exercise = Exercise.last
    expect(current_path).to eq(user_path(@kuba, exercise))
    expect(exercise.user_id).to eq(@kuba.id)
  end
end
