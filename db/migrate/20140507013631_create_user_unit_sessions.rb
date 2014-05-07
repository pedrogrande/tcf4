class CreateUserUnitSessions < ActiveRecord::Migration
  def change
    create_table :user_unit_sessions do |t|
      t.references :unit, index: true
      t.references :unit_session, index: true
      t.boolean :attended
      t.boolean :completed

      t.timestamps
    end
  end
end
