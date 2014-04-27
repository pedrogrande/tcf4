json.array!(@user_goals) do |user_goal|
  json.extract! user_goal, :id, :user_id, :goal_id, :notes, :achieved
  json.url user_goal_url(user_goal, format: :json)
end
