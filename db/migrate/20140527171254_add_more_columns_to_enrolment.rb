class AddMoreColumnsToEnrolment < ActiveRecord::Migration
  def change
    add_column :enrolments, :stripe_id, :string
    add_reference :enrolments, :payment, index: true
  end
end
