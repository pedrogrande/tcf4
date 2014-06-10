module PaymentsHelper
	def enrolment_price(enrolment)
		@enrolment = enrolment
		@special = Special.find(@enrolment.special_id)
		(@enrolment.popular_programme.price - @special.dollar_discount) * 100
	end
end
