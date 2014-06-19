class Referrer < ActiveRecord::Base
  belongs_to :user
  has_many :referral_enrolments
  has_many :enrolments, through: :referral_enrolments
end
