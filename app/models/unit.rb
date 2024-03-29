class Unit < ActiveRecord::Base
	belongs_to :skill_group
  belongs_to :skill_level
	has_many :user_units
	has_many :users, through: :user_units
	has_many :unit_skills
	has_many :skills, through: :unit_skills
	has_many :goal_units
	has_many :goals, through: :goal_units
	has_many :programme_units
  has_many :programmes, through: :programme_units
  has_many :unit_sessions
  has_many :popular_programme_units
  has_many :popular_programmes, through: :popular_programme_units
  has_many :cart_units
  has_many :carts, through: :cart_units

  extend FriendlyId
  friendly_id :name, use: :slugged
  acts_as_taggable

  scope :active, -> { where(active: true) }

  def self.skill_group_filter(skill_group)
  	active.where("skill_group_id = ?", skill_group.id)
  end

  def self.beginner_units
  	where(skill_level_id, 1)
  end

  def self.order_by_skill_level
    order(skill_level_id: :asc)
  end


end
