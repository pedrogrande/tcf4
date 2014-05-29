class AddColumnsToEnrolment < ActiveRecord::Migration
  def change
    add_column :enrolments, :price, :integer
    add_column :enrolments, :guid, :string
  end
end
