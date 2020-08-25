class Location < ApplicationRecord
  belongs_to :organization

  validates :name, :address, presence: true
end
