class AddIconToPopularProgramme < ActiveRecord::Migration
  def change
    add_column :popular_programmes, :icon, :string
  end
end
