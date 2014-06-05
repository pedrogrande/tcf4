class EnrolmentMailer < ActionMailer::Base
  default from: "Coder Factory Enrolment <enrolments@thecoderfactory.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enrolment_mailer.received.subject
  #
  def response(enrolment)
    @enrolment = enrolment
    mail(to: @enrolment.email, subject: @enrolment.first_name + ", you are now enrolled in The Coder Factory")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.download_programme.received.subject
  #
  def received(enrolment)
    @enrolment = enrolment
    mail(to: "info@thecoderfactory.com", subject: "Coder Factory Enrolment received")
  end
end
