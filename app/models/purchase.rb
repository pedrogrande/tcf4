class Purchase < ActiveRecord::Base
  belongs_to :payment
  belongs_to :user
  belongs_to :credit_point_pack

  before_create :populate_guid

  private
  def populate_guid
    self.guid = SecureRandom.uuid()
  end
end
