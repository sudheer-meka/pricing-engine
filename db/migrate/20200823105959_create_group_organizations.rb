class CreateGroupOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :group_organizations do |t|
      t.string :name
      t.string :organization_code
      t.belongs_to :country

      t.timestamps
    end
  end
end
