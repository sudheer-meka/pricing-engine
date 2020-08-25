class GroupOrganization < ApplicationRecord
  belongs_to :country
  has_many :organizations, dependent: :destroy
  has_many :locations, through: :organizations

  validates :name, :organization_code, presence: true

  def model_type_prices(data)
    organizations_by_type(data[:model_type_name]).map do |organization|
      {
        id: organization.id,
        calculated_price: data[:base_price] + organization.margin_price
      }
    end
  end

  def organizations_by_type(type)
    self.organizations.where(company_type: type)
  end
end
