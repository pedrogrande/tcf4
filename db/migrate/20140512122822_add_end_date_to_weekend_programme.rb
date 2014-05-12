class AddEndDateToWeekendProgramme < ActiveRecord::Migration
  def change
    add_column :weekend_programmes, :end_date, :date
  end
end
