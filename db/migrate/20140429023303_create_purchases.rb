class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :payment, index: true
      t.references :user, index: true
      t.string :guid
      t.integer :credit_points
      t.integer :price
      t.references :credit_point_pack, index: true

      t.timestamps
    end
  end
end
