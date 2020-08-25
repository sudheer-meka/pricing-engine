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

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(subject).to respond_to(:margin_price) }
      it { expect(subject).to respond_to(:price_calculator) }
    end

    context 'executes methods correctly' do
      context 'price_calculator' do
        it 'returns margin price calulator instance' do
          expect(subject.price_calculator).to be_a MarginPriceCalculator
        end
      end

      context 'margin_price' do
        it 'returns margin price' do
          price_calculator = subject.price_calculator
          price_calculator.stub(:price).and_return(100)
          subject.stub(:price_calculator).and_return(price_calculator)
          expect(subject.margin_price).to eq(100)
        end
      end
    end
  end
end
