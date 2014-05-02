class CreatePointsTransactions < ActiveRecord::Migration
  def change
    create_table :points_transactions do |t|
      t.references :user, index: true
      t.string :transaction_type
      t.integer :number_of_points
      t.integer :value_of_points
      t.text :notes
      t.boolean :approval_required
      t.boolean :approval_received
      t.integer :admin_id

      t.timestamps
    end
  end
end
