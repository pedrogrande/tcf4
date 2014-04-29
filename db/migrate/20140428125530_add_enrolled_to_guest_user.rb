class AddEnrolledToGuestUser < ActiveRecord::Migration
  def change
    add_column :guest_users, :enrolled, :boolean
  end
end
