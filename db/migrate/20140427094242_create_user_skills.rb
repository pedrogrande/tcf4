class CreateUserSkills < ActiveRecord::Migration
  def change
    create_table :user_skills do |t|
      t.references :user, index: true
      t.references :skill, index: true
      t.integer :skill_level

      t.timestamps
    end
    add_index :user_skills, [:user_id, :skill_id], unique: true
  end
end
