class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill

  def self.order_by_skill_level
  	where('skill_level > ?', 0).order(skill_level: :desc)
  end
end
