class EnrolmentMailerJob
	include SuckerPunch::Job

  def perform(enrolment_id)
    ActiveRecord::Base.connection_pool.with_connection do
    @enrolment = Enrolment.find(enrolment_id)
    EnrolmentMailer.response(@enrolment).deliver
    EnrolmentMailer.paid(@enrolment).deliver
    end
  end
end