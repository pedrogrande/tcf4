class Referrer < ActiveRecord::Base
  belongs_to :user
  has_many :referral_enrolments
  has_many :enrolments
end
