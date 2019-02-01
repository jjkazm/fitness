FactoryBot.define do
  factory :exercise do
    sequence (:duration_in_min) { |n|  "#{n+1000}" }
    sequence(:workout) { |n| "workout no #{n}" }
    workout_date { "2019-01-30" }
    user
  end

end
