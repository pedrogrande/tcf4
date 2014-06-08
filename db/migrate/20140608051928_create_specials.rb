class CreateSpecials < ActiveRecord::Migration
  def change
    create_table :specials do |t|
      t.integer :admin_id
      t.string :recipient_email
      t.references :popular_programme, index: true
      t.references :weekend_programme, index: true
      t.integer :dollar_discount
      t.integer :percent_discount
      t.string :guid
      t.date :date_redeemed

      t.timestamps
    end
  end
end
