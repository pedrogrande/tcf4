class PointsTable < ActiveRecord::Base
  belongs_to :user

  def add_received_points(number_of_points)
  	update_attributes(received: received.to_i + number_of_points.to_i)
  	update_current_points(number_of_points)
  end

  def update_current_points(number_of_points)
  	update_attributes(current: current.to_i + number_of_points.to_i)
  end

  def self.purchase_update_points(points_transaction)
  	@points_table = self.find_by(user_id: points_transaction.user_id)
  	@points_table.update_attributes(
  		purchased: @points_table.purchased.to_i + points_transaction.number_of_points.to_i,
  		current: @points_table.current.to_i + points_transaction.number_of_points.to_i
  	)
  end
end
