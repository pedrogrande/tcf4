json.array!(@enquiries) do |enquiry|
  json.extract! enquiry, :id, :name, :last_name, :email, :phone, :content
  json.url enquiry_url(enquiry, format: :json)
end
