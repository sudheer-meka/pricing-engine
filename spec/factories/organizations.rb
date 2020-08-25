FactoryBot.define do
  factory :organization do
    association :group_organization
    name { Faker::Company.name }
    public_name { Faker::Company.name }
    company_type { ['Show room', 'Service', 'Dealer'].sample }
    pricing_policy { %w[Flexible Fixed Prestige].sample }
  end
end
