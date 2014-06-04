class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :google_plus, :string
    add_column :profiles, :linkedin, :string
    add_column :profiles, :twitter, :string
    add_column :profiles, :github, :string
    add_column :profiles, :website, :string
    add_column :profiles, :show_email, :boolean
    add_column :profiles, :title, :string
    add_column :profiles, :info, :text
  end
end
