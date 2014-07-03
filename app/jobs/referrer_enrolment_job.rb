class ReferrerEnrolmentJob
	include SuckerPunch::Job

  def perform(enrolment_id, referrer)
    ActiveRecord::Base.connection_pool.with_connection do
    @enrolment = Enrolment.find(enrolment_id)
    @referrer = Referrer.find_by(referral_code: referrer)
    ReferralEnrolment.record_referral(@enrolment, @referrer)
    EnrolmentMailer.notification(@enrolment, @referrer).deliver
    end
  end
end