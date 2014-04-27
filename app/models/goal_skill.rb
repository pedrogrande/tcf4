class GoalSkill < ActiveRecord::Base
  belongs_to :goal
  belongs_to :skill
end
