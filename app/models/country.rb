class Country < ApplicationRecord
  has_many :group_organizations, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :country_code
end
