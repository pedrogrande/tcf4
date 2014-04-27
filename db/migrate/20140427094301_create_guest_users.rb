class CreateGuestUsers < ActiveRecord::Migration
  def change
    create_table :guest_users do |t|
      t.references :user, index: true
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
