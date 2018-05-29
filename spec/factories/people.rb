FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { CPF.generate }
    rg { Faker::Number.number(10) }
    member false
    occupation { Faker::Job.title }

    transient do
      phones nil
      address nil
    end

    after(:build) do |person, evaluator|
      person.address = evaluator.address ? evaluator.address : build(:address, addressable: person)

      phones = evaluator.phones ? evaluator.phones : build(:phone, person: person)
      person.phones << phones
    end
  end
end
