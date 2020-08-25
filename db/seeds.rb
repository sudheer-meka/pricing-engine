def create_countries

  3.times do
    country = Country.create(
      name: Faker::Address.country,
      country_code: Faker::Address.country_code
    )
    create_group_organizations(country)
  end
end

def create_group_organizations(country)
  2.times do
    group_organization = country.group_organizations.create(
      name: Faker::Company.name,
      organization_code: Faker::Name.initials(number: 4)
    )
    create_organizations(group_organization)
  end
end


def create_organizations(group_organization, parent_id = nil)
  5.times do
    organization = group_organization.organizations.create(
      name: Faker::Company.name,
      public_name: Faker::Company.name,
      company_type: ["Show room", "Service", "Dealer"].sample,
      pricing_policy: ["Flexible", "Fixed", "Prestige"].sample,
      parent_id: parent_id
    )
    create_organizations(group_organization, organization.id) unless parent_id
    create_locations(organization)
  end
end

def create_locations(organization)
  2.times do
    organization.locations.create(
      name: Faker::Address.street_name,
      address: {
        stree_address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip
      }
    )  
  end
end

create_countries

