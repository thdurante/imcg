FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { Faker::Internet.password }

    trait :confirmed do
      confirmed_at { Time.current }
    end
  end
end
