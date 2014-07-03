class ReferrerEnrolmentMailerPreview < ActionMailer::Preview
  def notification
  	@referrer = Referrer.first
  	@enrolment = Enrolment.find(18)
    ReferrerEnrolmentMailer.notification(@enrolment, @referrer)
  end
end