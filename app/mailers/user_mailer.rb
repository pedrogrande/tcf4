class UserMailer < ActionMailer::Base
  default from: "Coder Factory Enquiry <enquiry@thecoderfactory.com>"

  def contact_email(enquiry)
  	@enquiry = enquiry
  	mail(to: enquiry.email, subject: 'Thanks for your enquiry')
  end

  def contact_email_admin(enquiry)
  	@enquiry = enquiry
  	mail(to: "enquiry@thecoderfactory.com", subject: 'An enquiry has been recieved')
  end
end
