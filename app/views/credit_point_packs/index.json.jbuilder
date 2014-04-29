json.array!(@credit_point_packs) do |credit_point_pack|
  json.extract! credit_point_pack, :id, :name, :number_of_points, :price, :available
  json.url credit_point_pack_url(credit_point_pack, format: :json)
end
