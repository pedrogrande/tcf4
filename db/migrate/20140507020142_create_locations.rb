class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :building
      t.string :street
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.string :map_link

      t.timestamps
    end
  end
end
