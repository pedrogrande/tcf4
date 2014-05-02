json.array!(@payments) do |payment|
  json.extract! payment, :id, :payment_method, :payment_price, :credit_points_purchased, :user_id, :payment_received
  json.url payment_url(payment, format: :json)
end
