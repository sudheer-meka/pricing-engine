class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :public_name
      t.string :company_type
      t.string :pricing_policy
      t.belongs_to :group_organization
      t.references :parent

      t.timestamps
    end
  end
end
