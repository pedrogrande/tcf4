class CreateUnitSkills < ActiveRecord::Migration
  def change
    create_table :unit_skills do |t|
      t.references :unit, index: true
      t.references :skill, index: true
      t.integer :before_skill_level
      t.integer :after_skill_level

      t.timestamps
    end
    add_index :unit_skills, [:unit_id, :skill_id], unique: true
  end
end
