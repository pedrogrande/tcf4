class GuestUser < ActiveRecord::Base
	belongs_to :user
	has_many :guest_user_skills
	has_many :skills, through: :guest_user_skills
	has_many :guest_user_goals
	has_many :goals, through: :guest_user_goals
end
