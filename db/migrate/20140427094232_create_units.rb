class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :name
      t.string :tagline
      t.text :description
      t.integer :duration_minutes
      t.string :icon
      t.references :skill_group, index: true
      t.string :unit_code
      t.integer :workshop_credits
      t.integer :online_credits
      t.boolean :active

      t.timestamps
    end
  end
end
