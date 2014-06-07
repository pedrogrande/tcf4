class AddColumnsToUnit < ActiveRecord::Migration
  def change
    add_column :units, :outcome, :text
    add_column :units, :objectives, :text
    add_column :units, :benefits, :text
  end
end
