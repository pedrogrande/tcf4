class Profile < ActiveRecord::Base
  belongs_to :user
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true
  PROFILE_COMPLETION_POINTS = 10
  before_save :calculate_profile_completion_percentage

  def number_of_empty_attributes(profile)
  	count = 0
  	profile.attributes.each do |name, value|
  		if profile.attribute_present?(name)
  			count = count + 1
  		end
  	end
  end

  def calculate_profile_completion_percentage

  	self.attributes.each do |attr_name, attr_value|

  	end
 #  	if self.completion != 1
	#   	self.completion = 0
	#   	self.attributes.each do |attr_name, attr_value|
	#   		if !attr_value.nil?
	#   			self.completion = self.completion + 1
	#   		end
	#   	end
	#   	self.completion = self.completion / self.attributes.count
	#   	if self.completion = 1
	#   		self.user.points_table.add_received_points(PROFILE_COMPLETION_POINTS)
	#   	end
	# end

  end
end
