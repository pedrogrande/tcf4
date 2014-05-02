class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :payment_method
      t.integer :payment_price
      t.integer :credit_points_purchased
      t.references :user, index: true
      t.boolean :payment_received

      t.timestamps
    end
  end
end
