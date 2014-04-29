class AddConvertedToGuestUser < ActiveRecord::Migration
  def change
    add_column :guest_users, :converted, :boolean
  end
end
