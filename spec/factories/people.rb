FactoryBot.define do
  factory :person do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    cpf { CPF.generate }
    rg { Faker::Number.number(10) }
    member false
    occupation { Faker::Job.title }
  end
end
