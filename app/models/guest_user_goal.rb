class GuestUserGoal < ActiveRecord::Base
  belongs_to :guest_user
  belongs_to :goal
end
