class PointsTable < ActiveRecord::Base
  belongs_to :user

  def add_received_points(number_of_points)
  	update_attributes(received: received.to_i + number_of_points.to_i)
  	update_current_points(number_of_points)
  end

  def update_current_points(number_of_points)
  	update_attributes(current: current.to_i + number_of_points.to_i)
  end
end
