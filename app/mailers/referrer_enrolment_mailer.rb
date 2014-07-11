class ReferrerEnrolmentMailer < ActionMailer::Base
  default from: "Coder Factory Notification <info@thecoderfactory.com>"

  def notification(enrolment, referrer)
    @enrolment = enrolment
    @referrer = referrer
    mail(to: @referrer.user.email, subject: "Enrolment referral notification for " + @referrer.name)
  end
end
