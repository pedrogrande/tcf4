class User < ActiveRecord::Base
  rolify
	has_one :profile
  has_one :points_table
	has_many :programmes
	has_many :user_goals
	has_many :goals, through: :user_goals
	has_many :user_skills
	has_many :skills, through: :user_skills
	has_many :user_units
	has_many :units, through: :user_units

	accepts_nested_attributes_for :user_skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  def self.create_user_from_guest(guest_user)
  	if !User.where(email: guest_user.email)
  		generated_password = Devise.friendly_token.first(8)
			user = User.create!(email: guest_user.email, password: generated_password).save
		end
		copy_skills_to_user(user, guest_user)
		copy_goals_to_user(user, guest_user)
  end

  def self.copy_skills_to_user(user, guest_user)
  	guest_user.guest_user_skills.each do |guest_user_skill|
  		user_skill = UserSkill.new
  		user_skill.skill = guest_user_skill.skill
  		user_skill.level = guest_user_skill.level
  		user_skill.user = user
  		user_skill.save
  	end
  end

  def self.copy_goals_to_user(user, guest_user)
  	guest_user.goals.each do |goal|
  		user_goal = UserGoal.new
  		user_goal.goal = goal
  		user_goal.user = user
  		user_goal.save
  	end
  end
end
