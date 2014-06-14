class Testimonial < ActiveRecord::Base
	belongs_to :popular_programme
	mount_uploader :image, PostImageUploader

	def self.featured
		where(featured: true)
	end
end
