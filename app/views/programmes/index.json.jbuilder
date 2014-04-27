json.array!(@programmes) do |programme|
  json.extract! programme, :id, :user_id, :commenced, :completed, :name
  json.url programme_url(programme, format: :json)
end
