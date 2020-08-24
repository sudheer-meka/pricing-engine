class GroupOrganization < ApplicationRecord
  belongs_to :country
  has_many :organizations, dependent: :destroy
  has_many :locations, through: :organizations

  validates_presence_of :name, :organization_code
end
