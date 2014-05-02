class CreditPointPack < ActiveRecord::Base
	has_many :purchases

	def self.order_by_price
		order(price: :asc)
	end

	def self.available
		where(available: true)
	end
end
