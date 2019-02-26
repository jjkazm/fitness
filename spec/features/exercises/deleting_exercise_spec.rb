require 'rails_helper'

RSpec.feature 'Delete exercise' do
  before do
    @owner = create(:user)

    @owner_exercise = @owner.exercises.create!(duration_in_min: 48,
                                                workout: "My body building activity",
                                                workout_date: Date.today)
    login_as(@owner)
  end

  scenario "succesfully" do
    visit "/"

    click_link "My Lounge"

    path = "/users/#{@owner.id}/exercises/#{@owner_exercise.id}"
    link = "//a[contains(@href, '#{path}') and .//text()='Destroy']"

    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted.")
  end
end
