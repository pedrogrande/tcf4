class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	# validates :title, :lead, :content, :category_id, :slug, presence: true

	extend FriendlyId
	friendly_id :slug, use: :slugged
	acts_as_taggable

	def self.published
		where(publish: true)
	end

	def self.published_in_reverse_chron_order
		published.order(published_date: :desc)
	end
end
