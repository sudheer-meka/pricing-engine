class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.json :address
      t.belongs_to :organization

      t.timestamps
    end
  end
end
