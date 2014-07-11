class CreateReferralEnrolments < ActiveRecord::Migration
  def change
    create_table :referral_enrolments do |t|
      t.references :referrer, index: true
      t.references :enrolment, index: true
      t.integer :student_paid
      t.integer :amount_owed
      t.date :date_paid

      t.timestamps
    end
  end
end
