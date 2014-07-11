class AddRefSessionToReferralVisit < ActiveRecord::Migration
  def change
    add_column :referral_visits, :ref_session, :string
  end
end
