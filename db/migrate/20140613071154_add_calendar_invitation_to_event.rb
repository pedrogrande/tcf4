class AddCalendarInvitationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :calendar_invitation, :string
  end
end
