FactoryBot.define do
  factory :exercise do
    duration_in_min { 1 }
    workout { "MyText" }
    workout_date { "2019-01-30" }
    user { nil }
  end
end