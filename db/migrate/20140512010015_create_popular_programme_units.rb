class CreatePopularProgrammeUnits < ActiveRecord::Migration
  def change
    create_table :popular_programme_units do |t|
      t.references :popular_programme, index: true
      t.references :unit, index: true

      t.timestamps
    end
  end
end
