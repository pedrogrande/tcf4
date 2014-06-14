class RemoveCoursesFromTestimonial < ActiveRecord::Migration
  def change
    remove_column :testimonials, :courses, :string
  end
end
