require 'rails_helper'

RSpec.describe MarginPriceCalculator do
  let(:price_calculator) { MarginPriceCalculator.new("Flexible") }

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(price_calculator).to respond_to(:keyword_count) }
      it { expect(price_calculator).to respond_to(:price) }
      it { expect(price_calculator).to respond_to(:evaluate_rule) }
    end

    context 'executes methods correctly' do
      context 'evaluate_rule' do
        it "evaluates given rule" do
          price_calculator.stub(:keyword_count).and_return(10)
          price_calculator.stub(:rule).and_return({
            operand: :*, rhs: 100
          })
          expect(price_calculator.evaluate_rule).to eq(1000)
        end
      end

      context 'price' do
        it "returns keyword_count as it is if rule is blank" do
          price_calculator.stub(:keyword_count).and_return(10)
          price_calculator.stub(:rule).and_return(nil)
          expect(price_calculator.price).to eq(10)
        end

        it "returns evaluated rule if rule is present" do
          price_calculator.stub(:keyword_count).and_return(10)
          price_calculator.stub(:rule).and_return({
            operand: :+, rhs: 15
          })
          expect(price_calculator.price).to eq(25)
        end
      end

      context 'keyword_count' do
        it "returns keyword_count from parser" do
          parser = price_calculator.parser
          expect(price_calculator.keyword_count).to eq(parser.keyword_count)
        end
      end
    end  
  end
end
