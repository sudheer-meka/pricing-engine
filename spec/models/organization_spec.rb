require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a name"
  it "is not valid without a type"
  it "is not valid without a pricing_policy"

  describe "Associations" do
    it { is_expected.to belong_to(:group_organization) }
    it { is_expected.to belong_to(:parent).without_validating_presence }
    it { is_expected.to have_many(:child) }
    it { is_expected.to have_many(:locations) }
  end
end
