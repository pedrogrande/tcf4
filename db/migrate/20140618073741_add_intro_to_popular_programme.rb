class AddIntroToPopularProgramme < ActiveRecord::Migration
  def change
    add_column :popular_programmes, :intro, :text
  end
end
