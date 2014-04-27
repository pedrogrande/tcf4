json.array!(@skills) do |skill|
  json.extract! skill, :id, :name, :description, :icon, :skill_group_id
  json.url skill_url(skill, format: :json)
end
