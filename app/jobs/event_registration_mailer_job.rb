class EventRegistrationMailerJob
	include SuckerPunch::Job

  def perform(event_registration_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @event_registration = EventRegistration.find(event_registration_id)
	    EventRegistrationMailer.response(@event_registration).deliver
	    EventRegistrationMailer.received(@event_registration).deliver
    end
  end
end