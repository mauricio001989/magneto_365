FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    id_document { Faker::Number.number(digits: 7) }
    phone { Faker::Number.number(digits: 10) }
  end
end
