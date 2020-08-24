require 'rails_helper'

RSpec.describe Country, type: :model do
  subject { build(:country) }

  it 'has a valid factory' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a country code' do
    subject.country_code = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { is_expected.to have_many(:group_organizations) }
  end
end
