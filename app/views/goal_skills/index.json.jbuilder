json.array!(@goal_skills) do |goal_skill|
  json.extract! goal_skill, :id, :goal_id, :skill_id, :required_skill_level
  json.url goal_skill_url(goal_skill, format: :json)
end
