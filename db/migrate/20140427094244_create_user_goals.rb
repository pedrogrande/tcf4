class CreateUserGoals < ActiveRecord::Migration
  def change
    create_table :user_goals do |t|
      t.references :user, index: true
      t.references :goal, index: true
      t.text :notes
      t.boolean :achieved

      t.timestamps
    end
    add_index :user_goals, [:user_id, :goal_id], unique: true
  end
end
