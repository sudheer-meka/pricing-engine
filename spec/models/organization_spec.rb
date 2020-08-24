require 'rails_helper'

RSpec.describe Organization, type: :model do
  subject { build(:organization) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a type' do
    subject.company_type = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a pricing_policy' do
    subject.pricing_policy = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:group_organization) }
    it { is_expected.to belong_to(:parent).without_validating_presence }
    it { is_expected.to have_many(:child) }
    it { is_expected.to have_many(:locations) }
  end
end
