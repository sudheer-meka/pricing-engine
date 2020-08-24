require 'rails_helper'

RSpec.describe GroupOrganization, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a name"
  it "is not valid without a organization_code"


  describe "Associations" do
    it { is_expected.to belong_to(:country) }
    it { is_expected.to have_many(:organizations) }
  end
end
