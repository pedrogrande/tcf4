class CreateSkillLevels < ActiveRecord::Migration
  def change
    create_table :skill_levels do |t|
      t.string :name
      t.string :summary
      t.string :question
      t.integer :number

      t.timestamps
    end
  end
end
