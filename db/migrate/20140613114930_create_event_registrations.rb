class CreateEventRegistrations < ActiveRecord::Migration
  def change
    drop_table :event_registrations
    create_table :event_registrations do |t|
      t.references :event, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
