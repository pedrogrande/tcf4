class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.references :skill_group, index: true

      t.timestamps
    end
  end
end
