class AddStripeIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :stripe_id, :string
  end
end
