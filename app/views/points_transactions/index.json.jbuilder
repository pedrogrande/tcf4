json.array!(@points_transactions) do |points_transaction|
  json.extract! points_transaction, :id, :user_id, :transaction_type, :number_of_points, :value_of_points, :notes, :approval_required, :approval_received, :admin_id
  json.url points_transaction_url(points_transaction, format: :json)
end
