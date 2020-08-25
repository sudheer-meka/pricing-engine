class Country < ApplicationRecord
  has_many :group_organizations, dependent: :destroy

  validates_presence_of :name, :country_code
end
