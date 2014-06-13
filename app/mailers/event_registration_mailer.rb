class EventRegistrationMailer < ActionMailer::Base
  default from: "Coder Factory Event Registration <enrolments@thecoderfactory.com>"

  def response(event_registration)
    @event_registration = event_registration
    mail(to: @event_registration.email,
        subject: @event_registration.first_name + 
        ", you are now registered to attend " + 
        @event_registration.event.name +
        " at " +
        @event_registration.event.location.name
      )
  end

  def received(event_registration)
    @event_registration = event_registration
    mail(to: "info@thecoderfactory.com", subject: "Event Registration received")
  end
end