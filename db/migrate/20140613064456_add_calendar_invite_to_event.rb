class AddCalendarInviteToEvent < ActiveRecord::Migration
  def change
    add_column :events, :calendar_invite, :text
  end
end
