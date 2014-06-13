json.array!(@events) do |event|
  json.extract! event, :id, :name, :tagline, :description, :date, :start_time, :end_time, :location_id, :icon, :link, :slug
  json.url event_url(event, format: :json)
end
