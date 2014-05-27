class Payment < ActiveRecord::Base
  belongs_to :user
  has_one :purchase
  has_one :enrolment

  def self.credit_card_payment(amount)
  	@payment = Payment.create!(
  	  payment_price: amount,
  	  payment_method: 'CC'
  	)
  end
end
