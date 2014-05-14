class Enquiry < ActiveRecord::Base
	validates :name, :email, presence: true
	validates :name, length: { minimum: 2 }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
