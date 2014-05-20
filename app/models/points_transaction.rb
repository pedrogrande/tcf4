class PointsTransaction < ActiveRecord::Base
  belongs_to :user

  def self.purchase_points(purchase)
  	@points_transaction = PointsTransaction.create(
  		user_id: purchase.user.id, 
  		transaction_type: 'purchase', 
  		number_of_points: purchase.credit_points,
  		value_of_points: purchase.price,
  		approval_required: false,
  	)
  	@points_transaction.save
  	PointsTable.purchase_update_points(@points_transaction)
  end

end
