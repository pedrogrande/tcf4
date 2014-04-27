json.array!(@unit_skills) do |unit_skill|
  json.extract! unit_skill, :id, :unit_id, :skill_id, :before_skill_level, :after_skill_level
  json.url unit_skill_url(unit_skill, format: :json)
end
