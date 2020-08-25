class Country < ApplicationRecord
  has_many :group_organizations, dependent: :destroy

  validates :name, :country_code, presence: true
end
