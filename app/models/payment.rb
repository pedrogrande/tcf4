class Payment < ActiveRecord::Base
  belongs_to :user
  has_one :purchase

  def self.credit_card_payment(purchase, amount)
  	@payment = Payment.create!(
  	  payment_price: amount,
  	  payment_method: 'credit_card',
  	  credit_points_purchased: purchase.credit_points,
  	  user_id: purchase.user.id
  	)
  end
end
