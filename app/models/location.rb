class Location < ActiveRecord::Base
	has_many :unit_sessions
	has_many :weekend_programmes
	has_many :events
	mount_uploader :image, LocationImagesUploader
	mount_uploader :logo, LocationImagesUploader
	extend FriendlyId
	friendly_id :name, use: :slugged
end
