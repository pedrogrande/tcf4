json.array!(@unit_sessions) do |unit_session|
  json.extract! unit_session, :id, :unit_id, :day, :date, :start_time, :end_time, :location, :number_of_places, :number_of_students_registered
  json.url unit_session_url(unit_session, format: :json)
end
