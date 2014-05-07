class SkillGroup < ActiveRecord::Base
	has_many :skills
	has_many :units

	extend FriendlyId
  friendly_id :name, use: :slugged
end
