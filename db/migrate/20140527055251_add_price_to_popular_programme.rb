class AddPriceToPopularProgramme < ActiveRecord::Migration
  def change
    add_column :popular_programmes, :price, :integer
  end
end
