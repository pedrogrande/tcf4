class RemoveLocationInUnitSession < ActiveRecord::Migration
  def change
  	change_table :unit_sessions do |t|
  	  t.remove :location
  	end
  end
end
