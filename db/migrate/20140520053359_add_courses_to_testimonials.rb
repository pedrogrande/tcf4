class AddCoursesToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :courses, :string
  end
end
