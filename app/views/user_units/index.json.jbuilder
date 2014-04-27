json.array!(@user_units) do |user_unit|
  json.extract! user_unit, :id, :user_id, :unit_id, :commenced, :completed, :grade
  json.url user_unit_url(user_unit, format: :json)
end
