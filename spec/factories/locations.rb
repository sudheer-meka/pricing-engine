FactoryBot.define do
  factory :location do
    association :organization
    name { Faker::Address.street_name }
    address do
      {
        stree_address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip
      }
    end
  end
end
