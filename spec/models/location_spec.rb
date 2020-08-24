require 'rails_helper'

RSpec.describe Location, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a name"
  it "is not valid without address"

  describe "Associations" do
    it { is_expected.to belong_to(:organization) }
  end
end
