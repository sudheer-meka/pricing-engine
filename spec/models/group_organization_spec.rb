require 'rails_helper'

RSpec.describe GroupOrganization, type: :model do
  subject { build(:group_organization) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a organization_code' do
    subject.organization_code = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to have_many(:organizations) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(subject).to respond_to(:model_type_prices) }
      it { expect(subject).to respond_to(:organizations_by_type) }
    end

    context 'executes methods correctly' do
      context 'model_type_prices' do
        it 'resturns margin price + base price given' do
          organization = create(:organization)
          group_organization = organization.group_organization
          organization.stub(:margin_price).and_return(100)
          group_organization.stub(:organizations_by_type).and_return([organization])
          params = { base_price: 50, model_type_name: organization.company_type }
          calculated_price = group_organization.model_type_prices(params)[0][:calculated_price]
          expect(calculated_price).to eq(150)
        end

        it 'organizations_by_type' do
          organization = create(:organization)
          group_organization = organization.group_organization
          result = group_organization.organizations_by_type(organization.company_type).map(&:id)
          expect(result).to include(organization.id)
        end
      end
    end
  end
end
