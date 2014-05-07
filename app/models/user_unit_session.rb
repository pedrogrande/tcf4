class UserUnitSession < ActiveRecord::Base
  belongs_to :unit
  belongs_to :unit_session
end
