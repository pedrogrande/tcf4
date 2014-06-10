module PaymentsHelper
	def enrolment_price(enrolment)
		@enrolment = enrolment
		if @enrolment.special
			@special = Special.find(@enrolment.special_id)
			(@enrolment.popular_programme.price - @special.dollar_discount) * 100
		else
			@enrolment.popular_programme.price * 100
		end
	end
end
