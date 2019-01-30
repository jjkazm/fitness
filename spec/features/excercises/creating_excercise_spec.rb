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
    page.select '2018', from: 'exercise[workout_date(1i)]'
    page.select 'December', from: 'exercise[workout_date(2i)]'
    page.select '31', from: 'exercise[workout_date(3i)]'

    click_button "Create Exercise"

    expect(page).to have_content "Exercise has been created"

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@kuba, exercise))
    expect(exercise.user_id).to eq(@kuba.id)
  end
end
