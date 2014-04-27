json.array!(@units) do |unit|
  json.extract! unit, :id, :name, :tagline, :description, :duration_minutes, :icon, :skill_group_id, :unit_code, :workshop_credits, :online_credits, :active
  json.url unit_url(unit, format: :json)
end
