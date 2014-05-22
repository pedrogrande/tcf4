class AddColumnsToProgrammeUnit < ActiveRecord::Migration
  def change
    add_column :programme_units, :points, :integer
    add_column :programme_units, :price, :integer
  end
end
