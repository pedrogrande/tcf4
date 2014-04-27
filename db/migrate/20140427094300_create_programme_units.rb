class CreateProgrammeUnits < ActiveRecord::Migration
  def change
    create_table :programme_units do |t|
      t.references :programme, index: true
      t.references :unit, index: true

      t.timestamps
    end
    add_index :programme_units, [:programme_id, :unit_id], unique: true
  end
end
