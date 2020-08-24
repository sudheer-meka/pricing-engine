require 'rails_helper'

RSpec.describe GroupOrganization, type: :model do
  subject { build(:group_organization) }

  it 'is valid with valid attributes' do
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
end
