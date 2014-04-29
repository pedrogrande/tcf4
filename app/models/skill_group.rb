class SkillGroup < ActiveRecord::Base
	has_many :skills
	has_many :units
end
