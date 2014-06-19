json.array!(@referral_visits) do |referral_visit|
  json.extract! referral_visit, :id, :referrer_id
  json.url referral_visit_url(referral_visit, format: :json)
end
