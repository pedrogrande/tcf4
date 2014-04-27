class GoalUnit < ActiveRecord::Base
  belongs_to :unit
  belongs_to :goal
end
