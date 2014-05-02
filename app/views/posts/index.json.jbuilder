json.array!(@posts) do |post|
  json.extract! post, :id, :title, :lead, :content, :image, :publish, :user_id, :category_id, :slug
  json.url post_url(post, format: :json)
end
