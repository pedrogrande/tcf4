class AddProgrammeIdToGuestUser < ActiveRecord::Migration
  def change
    add_column :guest_users, :programme_id, :integer
  end
end
