class GuestUserSkill < ActiveRecord::Base
  belongs_to :guest_user
  belongs_to :skill
end
