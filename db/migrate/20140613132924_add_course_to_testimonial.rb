class AddCourseToTestimonial < ActiveRecord::Migration
  def change
    add_reference :testimonials, :popular_programme, index: true
  end
end
