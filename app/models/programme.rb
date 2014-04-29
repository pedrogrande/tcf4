class Programme < ActiveRecord::Base
  belongs_to :user
  has_many :programme_units
  has_many :units, through: :programme_units
end
