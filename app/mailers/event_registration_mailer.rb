class EventRegistrationMailer < ActionMailer::Base
  default from: "Coder Factory Enrolment <enrolments@thecoderfactory.com>"

  def response(event_registraion)
    @event_registraion = event_registraion
    mail(to: @event_registraion.email,
     subject: @event_registraion.first_name + 
        ", you are now registered to attend " + 
        @event_registration.event.name +
        " at " @event_registraion.event.location.name)
  end

  def received(event_registraion)
    @event_registraion = event_registraion
    mail(to: "info@thecoderfactory.com", subject: "Event Registration received")
  end
end
