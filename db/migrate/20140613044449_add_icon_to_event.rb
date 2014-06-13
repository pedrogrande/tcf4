class AddIconToEvent < ActiveRecord::Migration
  def change
    add_column :events, :icon, :string
  end
end
