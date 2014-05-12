class AddSlugToPopularProgramme < ActiveRecord::Migration
  def change
    add_column :popular_programmes, :slug, :string
    add_index :popular_programmes, :slug, unique: true
  end
end
