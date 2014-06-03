class RemovePublishFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :publish, :string
  end
end
