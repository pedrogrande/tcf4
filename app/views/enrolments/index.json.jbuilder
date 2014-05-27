json.array!(@enrolments) do |enrolment|
  json.extract! enrolment, :id, :first_name, :last_name, :phone, :email, :address, :suburb, :state, :postcode, :country, :popular_programme_id, :weekend_programme_id, :paid
  json.url enrolment_url(enrolment, format: :json)
end
