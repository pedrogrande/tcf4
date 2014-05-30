class AddAboutToEnrolment < ActiveRecord::Migration
  def change
    add_column :enrolments, :about, :text
  end
end
