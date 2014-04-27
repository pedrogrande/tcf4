json.array!(@goals) do |goal|
  json.extract! goal, :id, :name, :description, :icon
  json.url goal_url(goal, format: :json)
end
