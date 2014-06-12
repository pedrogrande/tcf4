class AddActiveToWeekendProgramme < ActiveRecord::Migration
  def change
    add_column :weekend_programmes, :active, :boolean
  end
end
