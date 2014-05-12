json.array!(@weekend_programmes) do |weekend_programme|
  json.extract! weekend_programme, :id, :popular_programme_id, :location_id, :day, :date, :start_time, :end_time, :number_of_places, :number_of_students_registered
  json.url weekend_programme_url(weekend_programme, format: :json)
end
