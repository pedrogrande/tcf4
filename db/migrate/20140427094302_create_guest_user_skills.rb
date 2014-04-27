class CreateGuestUserSkills < ActiveRecord::Migration
  def change
    create_table :guest_user_skills do |t|
      t.references :guest_user, index: true
      t.references :skill, index: true
      t.integer :skill_level

      t.timestamps
    end
    add_index :guest_user_skills, [:guest_user_id, :skill_id], unique: true
  end
end
