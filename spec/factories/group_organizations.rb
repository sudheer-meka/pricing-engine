FactoryBot.define do
  factory :group_organization do
    association :country
    name { Faker::Company.name }
    organization_code { Faker::Name.initials(number: 4) }
  end
end
