class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :lead
      t.text :content
      t.string :image
      t.string :publish
      t.references :user, index: true
      t.references :category, index: true
      t.string :slug

      t.timestamps
    end
  end
end
