class Special < ActiveRecord::Base
  belongs_to :popular_programme
  belongs_to :weekend_programme
  has_many :enrolments

  before_create :populate_guid
  after_create :set_programme, :set_discount

  

  def self.reverse_order
    order(created_at: :desc)
  end

  def set_programme
  	update_attributes(popular_programme_id: self.weekend_programme.popular_programme.id)
  end

  def set_discount
  	if dollar_discount.to_i > 0
  		update_attributes(percent_discount: self.weekend_programme.popular_programme.price / self.dollar_discount)
  	elsif percent_discount.to_i > 0
  		update_attributes(dollar_discount: self.weekend_programme.popular_programme.price * self.percent_discount / 100)
  	end
  end

  def self.has_been_redeemed(enrolment)
    special = enrolment.special
    special.update_attributes(date_redeemed: DateTime.now)
  end

  private
  def populate_guid
    self.guid = SecureRandom.uuid()
  end
end
