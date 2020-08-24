class Location < ApplicationRecord
  belongs_to :organization

  validates_presence_of :name, :address
end
