class CreatePopularProgrammes < ActiveRecord::Migration
  def change
    create_table :popular_programmes do |t|
      t.string :name
      t.string :tagline
      t.text :description
      t.integer :total_points
      t.references :credit_point_pack, index: true

      t.timestamps
    end
  end
end
