class CreateEnrolments < ActiveRecord::Migration
  def change
    create_table :enrolments do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :address
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.references :popular_programme, index: true
      t.references :weekend_programme, index: true
      t.boolean :paid

      t.timestamps
    end
  end
end
