require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { build(:location) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
 
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
 
  it 'is not valid without address' do
    subject.address = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:organization) }
  end
end
