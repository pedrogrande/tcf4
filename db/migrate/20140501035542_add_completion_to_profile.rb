class AddCompletionToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :completion, :decimal
  end
end
