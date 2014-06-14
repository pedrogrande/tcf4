class AddSkillLevelRefToUnit < ActiveRecord::Migration
  def change
    add_reference :units, :skill_level, index: true
  end
end
