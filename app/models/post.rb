class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	validates :title, :lead, :content, :category_id, :slug, presence: true

	extend FriendlyId
	friendly_id :slug, use: :slugged
end
