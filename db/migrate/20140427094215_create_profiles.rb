class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :phone
      t.string :profile_picture
      t.references :user, index: true
      t.string :slug

      t.timestamps
    end
  end
end
