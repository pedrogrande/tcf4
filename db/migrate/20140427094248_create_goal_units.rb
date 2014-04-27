class CreateGoalUnits < ActiveRecord::Migration
  def change
    create_table :goal_units do |t|
      t.references :unit, index: true
      t.references :goal, index: true

      t.timestamps
    end
    add_index :goal_units, [:goal_id, :unit_id], unique: true
  end
end
