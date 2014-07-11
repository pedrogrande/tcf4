json.array!(@referral_enrolments) do |referral_enrolment|
  json.extract! referral_enrolment, :id, :referrer_id, :enrolment_id, :student_paid, :amount_owed, :date_paid
  json.url referral_enrolment_url(referral_enrolment, format: :json)
end
