class CreditPointPack < ActiveRecord::Base

	def self.available
		where(available: true)
	end
end
