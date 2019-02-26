FactoryBot.define do
  factory :user do
    sequence (:email){ |n| "user#{n}@wp.pl"}
    password {"haslo123"}
    sequence (:first_name){ |n| "John#{n}"}
    sequence (:last_name){ |n| "Doe#{n}"}         
  end
end
