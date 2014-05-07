class AddSlugToSkillGroup < ActiveRecord::Migration
  def change
    add_column :skill_groups, :slug, :string
    add_index :skill_groups, :slug, unique: true
  end
end
