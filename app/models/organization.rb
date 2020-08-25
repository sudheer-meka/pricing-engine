class Organization < ApplicationRecord
  belongs_to :group_organization
  belongs_to :parent, class_name: 'Organization', optional: true
  has_many :child, class_name: 'Organization',
                   foreign_key: 'parent_id',
                   dependent: :destroy,
                   inverse_of: :parent
  has_many :locations, dependent: :destroy

  validates_presence_of :name, :company_type, :pricing_policy


  def margin_price
    price_calculator.price
  end

  def price_calculator
    MarginPriceCalculator.new(pricing_policy)
  end
end
