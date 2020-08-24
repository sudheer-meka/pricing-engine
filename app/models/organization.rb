class Organization < ApplicationRecord
  belongs_to :group_organization
  belongs_to :parent, class_name: 'Organization', optional: true
  has_many :child, class_name: 'Organization',
                   foreign_key: 'parent_id',
                   dependent: :destroy,
                   inverse_of: :parent
  has_many :locations, dependent: :destroy
end
