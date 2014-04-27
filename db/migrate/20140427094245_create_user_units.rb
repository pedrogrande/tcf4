class CreateUserUnits < ActiveRecord::Migration
  def change
    create_table :user_units do |t|
      t.references :user, index: true
      t.references :unit, index: true
      t.datetime :commenced
      t.datetime :completed
      t.decimal :grade

      t.timestamps
    end
    add_index :user_units, [:user_id, :unit_id], unique: true
  end
end
