class PopularProgramme < ActiveRecord::Base
  belongs_to :credit_point_pack
  has_many :popular_programme_units
  has_many :units, through: :popular_programme_units
  has_many :weekend_programmes
  has_many :enrolments
  has_many :specials
  has_many :testimonials

  is_impressionable
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  before_update :update_points

  def update_points
  	self.total_points = self.units.sum(:workshop_credits)
  	self.credit_point_pack = CreditPointPack.best_option(self.total_points)
  end

  def self.order_by_price
    order(price: :asc)
  end
end
