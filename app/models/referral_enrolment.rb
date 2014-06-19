class ReferralEnrolment < ActiveRecord::Base
  belongs_to :referrer
  belongs_to :enrolment

  def record_referral(enrolment, referrer)
  	@enrolment = Enrolment.find(enrolment.id)
  	@referrer = Referrer.find(referrer.id)
  	@referral_enrolment = ReferralEnrolment.new
  	@referral_enrolment.
  end
end
