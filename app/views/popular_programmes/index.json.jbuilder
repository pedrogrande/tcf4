json.array!(@popular_programmes) do |popular_programme|
  json.extract! popular_programme, :id, :name, :tagline, :description, :total_points, :credit_point_pack_id
  json.url popular_programme_url(popular_programme, format: :json)
end
