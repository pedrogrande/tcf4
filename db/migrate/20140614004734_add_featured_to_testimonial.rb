class AddFeaturedToTestimonial < ActiveRecord::Migration
  def change
    add_column :testimonials, :featured, :boolean
  end
end
