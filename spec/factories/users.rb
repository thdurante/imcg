FactoryBot.define do
  factory :user do
    association :person
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "user-#{n}" }
    password { Faker::Internet.password }
    confirmed_at { Time.current }
    approved_at { Time.current }
  end
end
