json.array!(@event_registrations) do |event_registration|
  json.extract! event_registration, :id, :event_id, :first_name, :last_name, :email, :phone
  json.url event_registration_url(event_registration, format: :json)
end
