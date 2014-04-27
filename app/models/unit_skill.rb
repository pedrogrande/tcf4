class UnitSkill < ActiveRecord::Base
  belongs_to :unit
  belongs_to :skill
end
