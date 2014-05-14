class UserMailer < ActionMailer::Base
  default from: "oliver@thecoderfactory.com"

  def contact_email(enquiry)
  	@enquiry = enquiry
  	mail(to: enquiry.email, subject: 'Thanks for your enquiry')
  end

  def contact_email_admin(enquiry)
  	@enquiry = enquiry
  	mail(to: "enquiry@thecoderfactory.com", subject: 'An enquiry has been recieved')
  end
end
