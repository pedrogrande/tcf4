class CreateWeekendProgrammes < ActiveRecord::Migration
  def change
    create_table :weekend_programmes do |t|
      t.references :popular_programme, index: true
      t.references :location, index: true
      t.string :day
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :number_of_places
      t.integer :number_of_students_registered

      t.timestamps
    end
  end
end
