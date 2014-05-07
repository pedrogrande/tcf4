json.array!(@testimonials) do |testimonial|
  json.extract! testimonial, :id, :name, :quote, :text, :image
  json.url testimonial_url(testimonial, format: :json)
end
