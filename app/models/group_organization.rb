class GroupOrganization < ApplicationRecord
  belongs_to :country
  has_many :organizations, dependent: :destroy
  has_many :locations, through: :organizations
end
