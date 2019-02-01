require 'rails_helper'

RSpec.feature 'Listing workouts' do
  before do
    @kuba = create(:user)
    sign_in @kuba
    @ex1 = create(:exercise, user: @kuba, workout_date: Date.today)
    @ex2 = create(:exercise, user: @kuba, workout_date: 2.days.ago)
    @ex3 = create(:exercise, user: @kuba, workout_date: 9.days.ago)
  end

  scenario "shows workouts for last 7 days" do
    visit "/"

    click_link "My Lounge"

    expect(page).to have_content(@ex1.duration_in_min)
    expect(page).to have_content(@ex1.workout)
    expect(page).to have_content(@ex1.workout_date)


    expect(page).to have_content(@ex2.duration_in_min)
    expect(page).to have_content(@ex2.workout)
    expect(page).to have_content(@ex2.workout_date)


    expect(page).not_to have_content(@ex3.duration_in_min)
    expect(page).not_to have_content(@ex3.workout)
    expect(page).not_to have_content(@ex3.workout_date)
  end

  scenario "doesn't display workouts for user with not workouts" do
    @kuba.exercises.delete_all
    visit "/"

    click_link "My Lounge"

    expect(page).to have_content("No workouts yet.")
    expect(page).not_to have_content(@ex1.duration_in_min)
    expect(page).not_to have_content(@ex1.workout)
    expect(page).not_to have_content(@ex1.workout_date)

  end
end
