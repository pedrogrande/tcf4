class PurchasesController < ApplicationController
	def new
		@purchase = Purchase.new
		@purchase.user = current_user
		if params[:credit_point_pack]
			@purchase.credit_point_pack = CreditPointPack.find(params[:credit_point_pack])
			@purchase.update_attribute(:credit_points, @purchase.credit_point_pack.number_of_points)
			@purchase.update_attribute(:price, @purchase.credit_point_pack.price)
		else
			@purchase.credit_points = params[:credit_points]
			@purchase.price = @purchase.credit_points * PRICE_PER_POINT
		end
		@purchase.save
		redirect_to new_payment_path(guid: @purchase.guid)
	end

	def upgrade_to_pack
		@purchase = Purchase.find(params[:id])
		@purchase.credit_point_pack = CreditPointPack.find(params[:credit_point_pack])
		@purchase.update_attribute(:credit_points, @purchase.credit_point_pack.number_of_points)
		@purchase.update_attribute(:price, @purchase.credit_point_pack.price)
		redirect_to :back
	end
end