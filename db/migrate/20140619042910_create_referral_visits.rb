class CreateReferralVisits < ActiveRecord::Migration
  def change
    create_table :referral_visits do |t|
      t.references :referrer, index: true

      t.timestamps
    end
  end
end
