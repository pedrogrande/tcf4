class CreateReferrers < ActiveRecord::Migration
  def change
    create_table :referrers do |t|
      t.references :user, index: true
      t.string :name
      t.string :contact_phone
      t.string :company
      t.string :referral_code

      t.timestamps
    end
  end
end
