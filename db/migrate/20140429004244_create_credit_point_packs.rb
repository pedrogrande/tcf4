class CreateCreditPointPacks < ActiveRecord::Migration
  def change
    create_table :credit_point_packs do |t|
      t.string :name
      t.integer :number_of_points
      t.integer :price
      t.boolean :available

      t.timestamps
    end
  end
end
