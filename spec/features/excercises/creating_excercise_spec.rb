require 'rails_helper'

RSpec.feature 'Creating excercise' do
  before do
    @kuba = create(:user)
    sign_in @kuba

    visit "/"

    click_link "My Lounge"
    click_link "New workout"

    expect(page).to have_link "Back"
  end

  scenario "with valid inputs" do
    fill_in "Duration", with: 70
    fill_in "Workout details", with: "Swimming"
    fill_in "Activity date", with: "31/12/2018"

    click_button "Create Exercise"

    expect(page).to have_content "Exercise has been created"

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@kuba, exercise))
    expect(exercise.user_id).to eq(@kuba.id)
  end

  scenario 'fails with empty input' do


    fill_in "Duration", with: ""
    fill_in "Workout details", with: ""
    fill_in "Activity date", with: ""

    click_button "Create Exercise"

    expect(page).to have_content "Exercise has not been created"

    expect(current_path).to eq(user_exercises_path(@kuba))

  end
end
