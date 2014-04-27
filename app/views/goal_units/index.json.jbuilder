json.array!(@goal_units) do |goal_unit|
  json.extract! goal_unit, :id, :unit_id, :goal_id
  json.url goal_unit_url(goal_unit, format: :json)
end
