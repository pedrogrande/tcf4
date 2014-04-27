class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.references :user, index: true
      t.datetime :commenced
      t.datetime :completed
      t.string :name

      t.timestamps
    end
  end
end
