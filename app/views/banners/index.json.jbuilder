json.array!(@banners) do |banner|
  json.extract! banner, :id, :name, :image, :link, :active
  json.url banner_url(banner, format: :json)
end
