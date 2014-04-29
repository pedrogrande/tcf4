class Profile < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
end
