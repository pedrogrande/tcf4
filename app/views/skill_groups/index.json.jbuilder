json.array!(@skill_groups) do |skill_group|
  json.extract! skill_group, :id, :name, :description, :icon
  json.url skill_group_url(skill_group, format: :json)
end
