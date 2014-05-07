json.array!(@locations) do |location|
  json.extract! location, :id, :name, :building, :street, :suburb, :state, :postcode, :country, :map_link
  json.url location_url(location, format: :json)
end
