class Unit < ActiveRecord::Base
	belongs_to :skill_group
	has_many :user_units
	has_many :users, through: :user_units
	has_many :unit_skills
	has_many :skills, through: :unit_skills
	has_many :goal_units
	has_many :goals, through: :goal_units
	has_many :programme_units
  has_many :programmes, through: :programme_units
end
