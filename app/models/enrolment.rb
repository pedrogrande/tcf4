class Enrolment < ActiveRecord::Base
  belongs_to :popular_programme
  belongs_to :weekend_programme
  belongs_to :payment
  belongs_to :special
  has_many :referral_enrolments
  has_many :referrals, through: :referral_enrolments
  
  is_impressionable

  validates :first_name, 
  					:last_name,
  					:email, 
  					:address, 
  					:suburb, 
  					:state, 
  					:postcode, 
  					presence: true

  before_create :populate_guid
  def self.reverse_order
    order(created_at: :desc)
  end
  private
  def populate_guid
    self.guid = SecureRandom.uuid()
  end

end
