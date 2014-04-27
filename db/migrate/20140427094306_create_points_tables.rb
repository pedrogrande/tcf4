class CreatePointsTables < ActiveRecord::Migration
  def change
    create_table :points_tables do |t|
      t.references :user, index: true
      t.integer :received
      t.integer :purchased
      t.integer :spent
      t.integer :current

      t.timestamps
    end
  end
end
