class CreateGoalSkills < ActiveRecord::Migration
  def change
    create_table :goal_skills do |t|
      t.references :goal, index: true
      t.references :skill, index: true
      t.integer :required_skill_level

      t.timestamps
    end
    add_index :goal_skills, [:goal_id, :skill_id], unique: true
  end
end
