json.array!(@specials) do |special|
  json.extract! special, :id, :admin_id, :recipient_email, :popular_programme_id, :weekend_programme_id, :dollar_discount, :percent_discount, :guid, :date_redeemed
  json.url special_url(special, format: :json)
end
