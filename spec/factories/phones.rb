FactoryBot.define do
  factory :phone do
    association :person
    number { Faker::PhoneNumber.subscriber_number(11) }
    kind { PhoneKind.names.sample }

    trait :marked_for_destruction do
      after(:build, &:mark_for_destruction)
    end
  end
end
