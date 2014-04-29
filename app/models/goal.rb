class Goal < ActiveRecord::Base
	has_many :user_goals
	has_many :users, through: :user_goals
	has_many :goal_skills
	has_many :skills, through: :goal_skills
	has_many :goal_units
	has_many :units, through: :goal_units
	has_many :guest_user_goals
	has_many :guest_users, through: :guest_user_goals
end
