class ReferralEnrolment < ActiveRecord::Base
  belongs_to :referrer
  belongs_to :enrolment

  def record_referral(enrolment, referrer)
  	@referral_enrolment = ReferralEnrolment.new
  	@referral_enrolment.enrolment = enrolment
  	@referral_enrolment.referrer = referrer
  	@dollar_discount = 0
  	if enrolment.special
  		@dollar_discount = enrolment.special.dollar_discount
  	end
  	@referral_enrolment.student_paid = enrolment.popular_programme.price - @dollar_discount
  	@referral_enrolment.amount_owed = @referral_enrolment.student_paid * 0.1
  	@referral_enrolment.save
  end
end
