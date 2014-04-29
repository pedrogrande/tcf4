class Skill < ActiveRecord::Base
  belongs_to :skill_group
  has_many :goal_skills
  has_many :goals, through: :goal_skills
  has_many :user_skills
  has_many :users, through: :user_skills
  has_many :unit_skills
  has_many :units, through: :unit_skills
  has_many :guest_user_skills
	has_many :guest_users, through: :guest_user_skills
end
