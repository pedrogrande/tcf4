class AddSpecialToEnrolment < ActiveRecord::Migration
  def change
    add_reference :enrolments, :special, index: true
  end
end
