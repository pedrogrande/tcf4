class Location < ActiveRecord::Base
	has_many :unit_sessions
	has_many :weekend_programmes
end
