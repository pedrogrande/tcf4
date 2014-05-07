class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :quote
      t.text :text
      t.string :image

      t.timestamps
    end
  end
end
