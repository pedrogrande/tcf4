class AddLocationToUnitSession < ActiveRecord::Migration
  def change
    add_reference :unit_sessions, :location, index: true
  end
end
