class Country < ApplicationRecord
  has_many :group_organizations, dependent: :destroy
end
