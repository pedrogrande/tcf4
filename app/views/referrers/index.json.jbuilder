json.array!(@referrers) do |referrer|
  json.extract! referrer, :id, :user_id, :name, :contact_phone, :company, :referral_code
  json.url referrer_url(referrer, format: :json)
end
