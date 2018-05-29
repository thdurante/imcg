FactoryBot.define do
  factory :address do
    street { Faker::Address.street_address }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    neighborhood { Faker::Lorem.word }
    city { Faker::Address.city }
    state { Faker::Address.state }
    addressable nil
  end
end
