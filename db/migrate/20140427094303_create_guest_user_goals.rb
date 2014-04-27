class CreateGuestUserGoals < ActiveRecord::Migration
  def change
    create_table :guest_user_goals do |t|
      t.references :guest_user, index: true
      t.references :goal, index: true

      t.timestamps
    end
    add_index :guest_user_goals, [:guest_user_id, :goal_id], unique: true
  end
end
