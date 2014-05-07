class CreateUnitSessions < ActiveRecord::Migration
  def change
    create_table :unit_sessions do |t|
      t.references :unit, index: true
      t.string :day
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :location
      t.integer :number_of_places
      t.integer :number_of_students_registered

      t.timestamps
    end
  end
end
