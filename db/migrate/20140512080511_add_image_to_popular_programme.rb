class AddImageToPopularProgramme < ActiveRecord::Migration
  def change
    add_column :popular_programmes, :image, :string
  end
end
