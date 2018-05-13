FactoryBot.define do
  factory :phone do
    association :person
    number { Faker::PhoneNumber.subscriber_number(11) }
    kind { PhoneKind.names.sample }
  end
end
