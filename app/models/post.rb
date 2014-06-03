class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	is_impressionable
	# validates :title, :lead, :content, :category_id, :slug, presence: true

	extend FriendlyId
	friendly_id :title, use: :slugged
	acts_as_taggable
	mount_uploader :image, PostImageUploader

	def self.published_in_reverse_chron_order
		reverse_chron_order.where(publish: true)
	end

	def self.reverse_chron_order
		order(published_date: :desc)
	end

	def self.popular_posts
		order(impressions_count: :desc)
	end
end
