class UpdateStudentNumberJob
	include SuckerPunch::Job

  def perform(enrolment_id)
    ActiveRecord::Base.connection_pool.with_connection do
	    @enrolment = Enrolment.find(enrolment_id)
	    @enrolment.weekend_programme.adjust_student_numbers
    end
  end
end

