class AddSkillLevelToUnit < ActiveRecord::Migration
  def change
    add_column :units, :skill_level, :integer
  end
end
