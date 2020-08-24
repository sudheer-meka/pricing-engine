require 'rails_helper'

RSpec.describe Country, type: :model do
  it 'is valid with valid attributes'
  it 'is not valid without a name'
  it 'is not valid without a country code'

  describe 'Associations' do
    it { is_expected.to have_many(:group_organizations) }
  end
end
