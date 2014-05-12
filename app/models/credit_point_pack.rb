class CreditPointPack < ActiveRecord::Base
	has_many :purchases
	has_many :popular_programmes

	def self.best_option(points)
		where("number_of_points > ?", points).order(number_of_points: :asc).first
	end

	def self.order_by_price
		order(price: :asc)
	end

	def self.available
		where(available: true)
	end
end
