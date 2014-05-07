class Location < ActiveRecord::Base
	has_many :unit_sessions
end
