class AddColsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :logo, :string
    add_column :locations, :embed_map, :text
    add_column :locations, :website, :string
    add_column :locations, :phone, :string
    add_column :locations, :image, :string
  end
end
