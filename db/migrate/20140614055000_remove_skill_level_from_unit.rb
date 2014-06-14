class RemoveSkillLevelFromUnit < ActiveRecord::Migration
  def change
    remove_column :units, :skill_level, :string
  end
end
